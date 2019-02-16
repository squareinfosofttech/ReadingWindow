//
//  ViewController.swift
//  readingWindow
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

import UIKit
import WebKit
import readingWindow //import reading window package

class ViewController: UIViewController { //demo for user reading window

    
    @IBOutlet weak var webview: UIWebView!
    private var webViewUrl = "https://www.bustle.com/p/7-reasons-slow-reading-is-actually-a-good-thing-because-being-a-speed-reader-is-overrated-73092"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.loadUrl()
        self.configReadingWindow()
    }
    
    private func loadUrl() {
        //load url in webview
        guard let url = URL(string: self.webViewUrl) else { return }
        self.webview.loadRequest(URLRequest(url: url))
    }
    
    private func configReadingWindow() {
        //MARK: customised reading window
        readingWindow.sharedInstance.setBackgroundColor = UIColor.black //set background color default color is black
        readingWindow.sharedInstance.setBackgroundAlpha = 0.8 //set background color alpha deafult color alpha is 0.9
        readingWindow.sharedInstance.setReadingAreaColor = UIColor.blue //set  reading area color default color is white clear
        readingWindow.sharedInstance.setReadingAreaAlpha = 0.1 //set reading area color alpha deafult color alpha is 0
        
        //set deafult reading area position and size
        //readingWindow.sharedInstance.setDefaultSize = CGRect(x: 10, y: 30, width: (self.webview.layer.bounds.width - 20), height: 60)
    }
    
    @IBAction func onClickReadingMode(_ sender: UIButton) {
        if readingWindow.sharedInstance.isEnable {
            //above condition is use for check reading mode is enable or not
            readingWindow.sharedInstance.hide()
        } else {
            readingWindow.sharedInstance.show(view: self.webview)
        }
    }

}

