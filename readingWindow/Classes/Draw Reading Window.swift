//
//  Draw Reading Window.swift
//  FBSnapshotTestCase
//
//  Created by Amit Surani on 23/03/18.
//

import Foundation
import UIKit

class DrawReadingWindow {
    /*
    call while load reading window and draw default position reading area in parent view.
    it is draw reading area as per reading view
    */
    func drawReadingArea(readingX:CGFloat,readingY:CGFloat,readingW:CGFloat,readingH:CGFloat,view:UIView,backColor:UIColor,backAlpha:CGFloat,readColor:UIColor) {
        //MARK: Draw Default Back Color Compact as per Reading View Frame
        background.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        background.backgroundColor = backColor.withAlphaComponent(backAlpha).cgColor
        
        //update readin are frame
        readingAreaShape.frame = background.bounds
        readingAreaShape.fillColor = readColor.cgColor
        
        //set reading area frame as per reading view
        readingFrame = CGRect(x: readingX, y: readingY, width: readingW, height: readingH)
        readingPath = UIBezierPath(rect: readingAreaShape.frame)
        
        readingAreaShape.fillRule = kCAFillRuleEvenOdd
        
        //append new path in reading area as per user intrection
        readingPath.append(UIBezierPath(rect: readingFrame))
        readingAreaShape.path = readingPath.cgPath
        
        //update background mask
        background.mask = readingAreaShape
        
        //add reading area in parent view
        view.layer.addSublayer(background)
    }
}
