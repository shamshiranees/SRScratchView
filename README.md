# SRScratchView

[![CI Status](http://img.shields.io/travis/shamshir.anees@gmail.com/SRScratchView.svg?style=flat)](https://travis-ci.org/shamshir.anees@gmail.com/SRScratchView)
[![Version](https://img.shields.io/cocoapods/v/SRScratchView.svg?style=flat)](http://cocoapods.org/pods/SRScratchView)
[![License](https://img.shields.io/cocoapods/l/SRScratchView.svg?style=flat)](http://cocoapods.org/pods/SRScratchView)
[![Platform](https://img.shields.io/cocoapods/p/SRScratchView.svg?style=flat)](http://cocoapods.org/pods/SRScratchView)

## ScreenShots

![ScreenShot](https://i.imgflip.com/223yh1.gif)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
Swift 4.0 <br>
Xcode 9.0 <br>
## Installation

SRScratchView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SRScratchView'
```
or add [SAScratchView.swift](https://github.com/shamshiranees/SRScratchView/blob/master/SRScratchView/Classes/SRScratchView.swift) file into your project directory.
## Usage

Change class of your  imageView to SRSrcatchView.
```swift
import SRScratchView

//Add delegate
class ViewController: UIViewController,SRScratchViewDelegate{

override func viewDidLoad() {
super.viewDidLoad()

self.scratchImageView.delegate = self

}


//delegate method
func scratchCardEraseProgress(eraseProgress: Float) {

//Here you will get erase progress in percentage

}
}

```
### Customize
```swift

//width of srcatch line
yourView.lineWidth = 40.0

//shape of scrach line
yourView.lineType = .square
```


## Author

 shamshir.anees@gmail.com

## License

SRScratchView is available under the MIT license. See the LICENSE file for more info.
