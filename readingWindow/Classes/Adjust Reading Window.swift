//
//  Adjust Reading Window.swift
//  FBSnapshotTestCase
//
//  Created by Amit Surani on 23/03/18.
//

import Foundation
import UIKit

class AdjustReadingWindow {
    
    let UI = UIComponents()
    
    
     func adjustReadingArea() {
        //MARK: init Const. Value of Reading Viw and Webview Frame Size
        let readingX = UI.readingArea.frame.origin.x
        let readingY = UI.readingArea.frame.origin.y
        let readingW = UI.readingArea.frame.width
        let readingH = UI.readingArea.frame.height
        
        //MARK: Update all Black Compact as per Reading Area Frame
        UI.readingFrame = CGRect(x: readingX, y: readingY, width: readingW, height: readingH)
        UI.readingPath = UIBezierPath(rect: UI.readingAreaShape.frame)
        
        UI.readingAreaShape.fillRule = kCAFillRuleEvenOdd
        
        UI.readingPath.append(UIBezierPath(rect: UI.readingFrame))
        UI.readingAreaShape.path = UI.readingPath.cgPath
        
        UI.background.mask = UI.readingAreaShape
        
    }
}
