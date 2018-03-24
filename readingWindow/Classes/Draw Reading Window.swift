//
//  Draw Reading Window.swift
//  FBSnapshotTestCase
/*
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 
 */

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
