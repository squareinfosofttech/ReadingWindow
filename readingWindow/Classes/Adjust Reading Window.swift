//
//  Adjust Reading Window.swift
//  FBSnapshotTestCase
//
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
