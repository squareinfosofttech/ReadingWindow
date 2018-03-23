//
//  Adjust Reading Window.swift
//  FBSnapshotTestCase
//
//  Created by Amit Surani on 23/03/18.
//

import Foundation
import UIKit

class AdjustReadingWindow {

    /*
        it is work when move or resize reading area. set new area position and update reading area frame as per user intrection selected area.
     it is call while user Gesture recognizer. Pan & Pinch
     */
    
     func adjustReadingArea() {
        //MARK: init Const. Value of Reading Viw and Webview Frame Size
        let readingX = readingArea.frame.origin.x
        let readingY = readingArea.frame.origin.y
        let readingW = readingArea.frame.width
        let readingH = readingArea.frame.height
        
        //MARK: Update all Black Compact as per Reading Area Frame
        readingFrame = CGRect(x: readingX, y: readingY, width: readingW, height: readingH)
        
        //update new reading area position as per reading view and set new reading area path
        readingPath = UIBezierPath(rect: readingAreaShape.frame)
        
        readingAreaShape.fillRule = kCAFillRuleEvenOdd
        
        readingPath.append(UIBezierPath(rect: readingFrame))
        readingAreaShape.path = readingPath.cgPath
        
        background.mask = readingAreaShape
        
    }
}
