# Reading Window

[![CI Status](http://img.shields.io/travis/amit44405/readingWindow.svg?style=flat)](https://travis-ci.org/amit44405/readingWindow)
[![Version](https://img.shields.io/cocoapods/v/readingWindow.svg?style=flat)](http://cocoapods.org/pods/readingWindow)
[![License](https://img.shields.io/cocoapods/l/readingWindow.svg?style=flat)](http://cocoapods.org/pods/readingWindow)
[![Platform](https://img.shields.io/cocoapods/p/readingWindow.svg?style=flat)](http://cocoapods.org/pods/readingWindow)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

Import readingWindow Package in your project :

```ruby
import readingWindow
```

call Show() method and pass any UIview :

```ruby
readingWindow.sharedInstance.show(view: self.webview)
```

if you want to remove it then call :

```ruby
readingWindow.sharedInstance.hide()
```

## Customised Reading Window :

set background color default color is black

```ruby
readingWindow.sharedInstance.setBackgroundColor = UIColor.orange
```

set background color alpha deafult color alpha is 0.9

```ruby
readingWindow.sharedInstance.setBackgroundAlpha = 0.8
```

set  reading area color default color is white clear

```ruby
readingWindow.sharedInstance.setReadingAreaColor = UIColor.blue
```

set reading area color alpha deafult color alpha is 0

```ruby
readingWindow.sharedInstance.setReadingAreaAlpha = 0.1
```

set deafult reading window position and size

```
readingWindow.sharedInstance.setDefaultSize = CGRect(x: 99, y: 50, width: 180, height: 30)
```

## Demo Screen Shot
![alt text](ReadingWindow/Example/readingWindow/ScreenShot.png)


## Requirements

```ruby
Swift 4 or later
```

## Installation

readingWindow is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'readingWindow'
```

## Author

Squareinfosoft, tech@squareinfosoft.com

## License

readingWindow is available under the MIT license. See the LICENSE file for more info.
