# PKStatusBarLoader

[![CI Status](http://img.shields.io/travis/kansaraprateek/PKStatusBarLoader.svg?style=flat)](https://travis-ci.org/kansaraprateek/PKStatusBarLoader)
[![Version](https://img.shields.io/cocoapods/v/PKStatusBarLoader.svg?style=flat)](http://cocoapods.org/pods/PKStatusBarLoader)
[![License](https://img.shields.io/cocoapods/l/PKStatusBarLoader.svg?style=flat)](http://cocoapods.org/pods/PKStatusBarLoader)
[![Platform](https://img.shields.io/cocoapods/p/PKStatusBarLoader.svg?style=flat)](http://cocoapods.org/pods/PKStatusBarLoader)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Screenshots

<img src="http://www.prateekkansara.com/GitProjectImages/PKStatusBarLoader/PKStatusBar.gif" width="320" height="508"></img> 

## Requirements

## Installation

PKStatusBarLoader is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "PKStatusBarLoader"
```

```ruby

import PKStatusBarLoader

```

// How To Use

```ruby

// Set the background Color
PKStatusBarLoader.setBackgroundColor(color: UIColor.orange)

// Set header Message
PKStatusBarLoader.show(withMessage: "Yayyy")

// Dismiss status bar
PKStatusBarLoader.dismiss()

```

// Update UI Elements with [String : Any] object. Call

```ruby
PKStatusBarLoader.setupLoaderUI(data: [
    kPKStatusBarLoaderBKGColor : UIColor.black,
    kPKStatusBarLoaderHeaderTextFont : UIFont.init(name: <Font_Name>, size: 10.0),
    kPKStatusBarLoaderHeaderTextColor : UIColor.white,
    kPKStatusBarLoaderHeaderTextBKGColor : UIColor.clear
])

```

## Author

kansaraprateek, prateek@tagrem.com

## License

PKStatusBarLoader is available under the MIT license. See the LICENSE file for more info.
