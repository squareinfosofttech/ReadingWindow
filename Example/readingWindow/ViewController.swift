//
//  ViewController.swift
//  readingWindow
//
//  Created by amit44405 on 03/23/2018.
//  Copyright (c) 2018 amit44405. All rights reserved.
//

import UIKit
import WebKit
import readingWindow //import reading window package

class ViewController: UIViewController { //demo for user reading window

    
    @IBOutlet weak var webview: UIWebView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //load loacal pdf in webview
        if let pdfURL = Bundle.main.url(forResource: "swiftDemo", withExtension: "pdf", subdirectory: nil, localization: nil)  {
            do {
                //convert pdf to data fromate
                let data = try Data(contentsOf: pdfURL)
                //load pdf from pdf data
                webview.load(data, mimeType: "application/pdf", textEncodingName:"", baseURL: pdfURL.deletingLastPathComponent())
            }
            catch {
                // catch errors here if pdf not load
                print("-------pdf not load-------")
            }
            
        }
        
        //MARK: customised reading window
        
        readingWindow.sharedInstance.setBackgroundColor = UIColor.orange //set background color default color is black
        readingWindow.sharedInstance.setBackgroundAlpha = 0.8 //set background color alpha deafult color alpha is 0.9
        readingWindow.sharedInstance.setReadingAreaColor = UIColor.blue //set  reading area color default color is white clear
        readingWindow.sharedInstance.setReadingAreaAlpha = 0.1 //set reading area color alpha deafult color alpha is 0

        //set deafult reading area position and size
        readingWindow.sharedInstance.setDefaultSize = CGRect(x: 99, y: 50, width: 180, height: 30)
    }

    @IBAction func onClickReadingMode(_ sender: UIButton) {
        if readingWindow.sharedInstance.isEnable {
            readingWindow.sharedInstance.hide()
        } else {
            readingWindow.sharedInstance.show(view: self.webview)
        }
    }

}

