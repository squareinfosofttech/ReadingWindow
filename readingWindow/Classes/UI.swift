//
//  UI.swift
//  FBSnapshotTestCase
//
//  Created by Amit Surani on 23/03/18.
//

import Foundation
import UIKit

        //UI Components
        let readingArea = UIView() //for user intrection
        let background = CALayer() //for background view and also user for scroll parent view content
        let readingAreaShape = CAShapeLayer() //reading area sub mask
        var readingFrame = CGRect() //reading area frame size dynamically
        var readingPath = UIBezierPath() //reading area path
        var readingView = UIView() //user while change reading area postion and Resize readign area
        
        //gesture
        let moveReading = UIPanGestureRecognizer() // user for move areading area in parent view
        let resizeReading = UIPinchGestureRecognizer() // user for resize reading area in parent view
