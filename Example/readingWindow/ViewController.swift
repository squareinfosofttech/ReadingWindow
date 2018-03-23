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

    //create webivew
    let webSite = UIWebView()
    
    //create uibutton
    let enableReadingMode = UIButton()
    
    //create title lable
    let titleLable = UILabel()
    
    //create object of reading mode
    let reading = readingWindow()
    
    var isReadingModeEnable = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //set webview frame
         self.webSite.frame = CGRect(x: 0, y: 80, width: self.view.frame.width, height: self.view.frame.height - 80)
        
        //load loacal pdf in webview
        if let pdfURL = Bundle.main.url(forResource: "swiftDemo", withExtension: "pdf", subdirectory: nil, localization: nil)  {
            do {
                //convert pdf to data fromate
                let data = try Data(contentsOf: pdfURL)
                //load pdf from pdf data
                webSite.load(data, mimeType: "application/pdf", textEncodingName:"", baseURL: pdfURL.deletingLastPathComponent())
                
                //add webview in super view
                self.view.addSubview(self.webSite)
                
                //set button frame
                self.enableReadingMode.frame = CGRect(x: self.view.frame.width - 60, y: 27, width: 40, height: 40)
                self.enableReadingMode.setImage(UIImage(named: "vision"), for: .normal)
                self.enableReadingMode.addTarget(self, action: #selector(self.onClickReadingMode(_sender:)), for: .touchUpInside)
                //add button in parent view
                self.view.addSubview(self.enableReadingMode)
                
                //set title lable frame
                self.titleLable.frame = CGRect(x: 20, y: 20, width: self.view.frame.width - 60, height: 50)
                self.titleLable.text = "Reading Window Demo"
                self.titleLable.font = UIFont.boldSystemFont(ofSize: 20)
                
                //add titlelable in parent view
                self.view.addSubview(self.titleLable)
            }
            catch {
                // catch errors here if pdf not load
                print("-------pdf not load-------")
            }
            
        }
        
        //MARK: customized reading window
        reading.backColor = UIColor.orange //set background color default color is black
        reading.backgroundAlpha = 0.8 //set background color alpha deafult color alpha is 0.9
        reading.readingAreaColor = UIColor.blue //set  reading area color default color is white
        reading.readingAreaAlpha = 0.1 //set reading area color alpha deafult color alpha is 0
    }

    @objc func onClickReadingMode(_sender:UIButton) {
        if isReadingModeEnable {
            //stop reading mode
            self.reading.removeWindow()
            self.isReadingModeEnable = false
        } else {
            //start reading mode
            self.reading.addWindow(view: self.webSite)
            self.isReadingModeEnable = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

