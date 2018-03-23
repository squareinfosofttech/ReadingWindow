//
//  Gesture.swift
//  FBSnapshotTestCase
//
//  Created by Amit Surani on 23/03/18.
//

import Foundation
import UIKit

class Gesture {
    
    let UI = UIComponents()
    let adjustReadingArea = AdjustReadingWindow()
    
    @objc func moveReading(_ sender: UIPanGestureRecognizer) {
        //MARK: Config. Pan Gesture for Reading View
        let translation = sender.translation(in: UI.readingView)
        sender.view!.center = CGPoint(x: sender.view!.center.x + translation.x, y: sender.view!.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: UI.readingView)
        
        //MARK: Call function for Resize All Black Compact as per Readingview Frame
        adjustReadingArea.adjustReadingArea()
        
    }
    
    @objc func resizeReadingArea(_ sender: UIPinchGestureRecognizer) {
        //MARK: Config. Pinch Gesture for Reading View
        sender.view?.transform = (sender.view?.transform)!.scaledBy(x: sender.scale, y: sender.scale)
        sender.scale = 1.0
        
        //MARK: Call function for Resize All Black Compact as per Readingview Frame
        adjustReadingArea.adjustReadingArea()
    }
}
