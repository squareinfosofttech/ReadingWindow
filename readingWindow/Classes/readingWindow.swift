//
//  readingWindow.swift
//  FBSnapshotTestCase
//
//  Created by Amit Surani on 23/03/18.
//

//public class readingWindow it access view import readingWindow package
public class readingWindow:NSObject {

    public static let sharedInstance = readingWindow()

    private override init() { }
    
    public var setBackgroundAlpha:CGFloat = 0.9 //background color alpha
    public var setReadingAreaAlpha:CGFloat = 0 //reading area color alpha
    public var setBackgroundColor = UIColor.black //background color
    public var setReadingAreaColor = UIColor.white //reading area color
    
    public var setDefaultSize = CGRect(x: 11, y: 31, width: 211, height: 37) //defaulr frame of reading area

    private let drawArea = DrawReadingWindow() //access draw first time reading area
    private let manageArea = AdjustReadingWindow() //redraw reading area
    
    public var isEnable = false

    
    
    public func show(view:UIView){ // for start reading mode
            readingView = view // init gesture views
            //MARK: init Gesture Pinch & Pan
            self.config() //config all component
        }
    
    
    private func config() {
        //add target to reading area for move area position
        moveReading.addTarget(self, action: #selector(self.moveReadingArea(_:)))
        
        //add target to resize reading area
        resizeReading.addTarget(self, action: #selector(self.resizeReadingArea(_:)))
        
        //set reading area deafult frame
        readingArea.frame = self.setDefaultSize
        
        //set reading area default background color
        readingArea.backgroundColor = self.setReadingAreaColor.withAlphaComponent(self.setReadingAreaAlpha)
        
        //MARK: Add Reading Subview in Webview also add Gesture to Subview
        readingView.addSubview(readingArea)
        
        //user intrection enable in reading area for move & resize reading area
        readingArea.isUserInteractionEnabled = true
        
        //add Gesture Reconizer for move reading area
        readingArea.addGestureRecognizer(moveReading)
        
        //add Geture Reconizer for resize Reading area
        readingArea.addGestureRecognizer(resizeReading)
        
        //add delegate for gesture reconizer
        moveReading.delegate = self as? UIGestureRecognizerDelegate
        resizeReading.delegate = self as? UIGestureRecognizerDelegate
        
        //init default reading area positon
        let readingX = readingArea.frame.origin.x
        let readingY = readingArea.frame.origin.y
        let readingW = readingArea.frame.width
        let readingH = readingArea.frame.height
        
        
        //call to craw reading area firat time
        drawArea.drawReadingArea(readingX: readingX, readingY: readingY, readingW: readingW, readingH: readingH, view: readingView, backColor: self.setBackgroundColor, backAlpha: self.setBackgroundAlpha, readColor: self.setReadingAreaColor)
        
        self.isEnable = true
    }
    
    @objc func moveReadingArea(_ sender: UIPanGestureRecognizer) {
        //MARK: Config. Pan Gesture for Reading View
        let translation = sender.translation(in: readingView)
        //resize reading view
        sender.view!.center = CGPoint(x: sender.view!.center.x + translation.x, y: sender.view!.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: readingView)

        //MARK: Call function for Resize All  Compact as per Readingview Frame update all frame as per reading view
        manageArea.adjustReadingArea()

    }

    @objc func resizeReadingArea(_ sender: UIPinchGestureRecognizer) {
        //MARK: Config. Pinch Gesture for Reading View
        
        //move reading area
        sender.view?.transform = (sender.view?.transform)!.scaledBy(x: sender.scale, y: sender.scale)
        sender.scale = 1.0

        //MARK: Call function for Resize All Black Compact as per Readingview Frame
        manageArea.adjustReadingArea()
    }

    
    public func hide() { //for stop reading mode
        
        //remove reading area & background view from parent view
        readingArea.removeFromSuperview()
        background.removeFromSuperlayer()
        self.isEnable = false
    }
    
}


