//
//  readingWindow.swift
//  FBSnapshotTestCase
//
//  Created by Amit Surani on 23/03/18.
//

import Foundation
import UIKit

//public class readingWindow it access view import readingWindow package
class readingWindow {
    
    //UI componants
    private let UI = UIComponents()
    
    //variables
    var backAlpha:CGFloat = 0.9
    var readingAreaAlpha:CGFloat = 0
    var backColor = UIColor.black
    var readingAreaColor = UIColor.white
    
    private let GestureRecognizer = Gesture()
   
    private let drawReadingWindow = DrawReadingWindow()
    
    public func addWindow(view:UIView){
        
        UI.readingView = view
        //MARK: init Gesture Pinch & Pan
        UI.moveReadingArea.addTarget(self, action: #selector(GestureRecognizer.moveReading(_:)))
        UI.resizeReadingArea.addTarget(self, action: #selector(GestureRecognizer.resizeReadingArea(_:)))
        UI.readingArea.frame = CGRect(x: 11, y: 31, width: 211, height: 37)
        UI.readingArea.backgroundColor = self.readingAreaColor.withAlphaComponent(self.readingAreaAlpha)
        
        //MARK: Add Reading Subview in Webview also add Gesture to Subview
        view.addSubview(UI.readingArea)
        UI.readingArea.isUserInteractionEnabled = true
        UI.readingArea.addGestureRecognizer(UI.moveReadingArea)
        UI.readingArea.addGestureRecognizer(UI.resizeReadingArea)
        UI.moveReadingArea.delegate = self as? UIGestureRecognizerDelegate
        UI.resizeReadingArea.delegate = self as? UIGestureRecognizerDelegate
        
        let readingX = UI.readingArea.frame.origin.x
        let readingY = UI.readingArea.frame.origin.y
        let readingW = UI.readingArea.frame.width
        let readingH = UI.readingArea.frame.height
        
        drawReadingWindow.drawReadingArea(readingX: readingX, readingY: readingY, readingW: readingW, readingH: readingH, view: view)
    }
    
   
    public func removeWindow() {
        UI.readingArea.removeFromSuperview()
        UI.background.removeFromSuperlayer()
    }
    
}

