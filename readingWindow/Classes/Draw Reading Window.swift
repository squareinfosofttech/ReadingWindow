//
//  Draw Reading Window.swift
//  FBSnapshotTestCase
//
//  Created by Amit Surani on 23/03/18.
//

import Foundation
import UIKit

class DrawReadingWindow {
    
    let UI = UIComponents()
    let ReadingWindow = readingWindow()
    
     func drawReadingArea(readingX:CGFloat,readingY:CGFloat,readingW:CGFloat,readingH:CGFloat,view:UIView) {
        //MARK: Draw Default Back Color Compact as per Reading View Frame
        UI.background.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        UI.background.backgroundColor = ReadingWindow.backColor.withAlphaComponent(ReadingWindow.backAlpha).cgColor
        
        UI.readingAreaShape.frame = UI.background.bounds
        UI.readingAreaShape.fillColor = ReadingWindow.readingAreaColor.cgColor
        
        UI.readingFrame = CGRect(x: readingX, y: readingY, width: readingW, height: readingH)
        UI.readingPath = UIBezierPath(rect: UI.readingAreaShape.frame)
        
        UI.readingAreaShape.fillRule = kCAFillRuleEvenOdd
        
        UI.readingPath.append(UIBezierPath(rect: UI.readingFrame))
        UI.readingAreaShape.path = UI.readingPath.cgPath
        
        UI.background.mask = UI.readingAreaShape
        
        view.layer.addSublayer(UI.background)
    }
}
