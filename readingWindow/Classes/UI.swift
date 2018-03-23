//
//  UI.swift
//  FBSnapshotTestCase
//
//  Created by Amit Surani on 23/03/18.
//

import Foundation
import UIKit

class UIComponents {
    //UI Components
     let readingArea = UIView()
     let background = CALayer()
     let readingAreaShape = CAShapeLayer()
     var readingFrame = CGRect()
     var readingPath = UIBezierPath()
     var readingView = UIView()
    
    //gesture
    let moveReadingArea = UIPanGestureRecognizer()
    let resizeReadingArea = UIPinchGestureRecognizer()
}
