# OAuthReactiveSwift

<img  src="https://raw.githubusercontent.com/OAuthSwift/OAuthSwift/master/Assets/OAuthSwift-icon.png" alt="OAuthSwift" hspace=20 /> <img  src="https://avatars2.githubusercontent.com/u/3422977?v=3&s=200" alt="ReactiveCocoa" width = "400"/>

[![Join the chat at https://gitter.im/OAuthSwift/OAuthSwift](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/OAuthSwift/OAuthSwift?utm_campaign=pr-badge&utm_content=badge&utm_medium=badge&utm_source=badge)
[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat
            )](http://mit-license.org) [![Platform](https://img.shields.io/badge/platform-iOS_OSX-lightgrey.svg?style=flat
             )](https://developer.apple.com/resources/) [![Language](https://img.shields.io/badge/language-swift-orange.svg?style=flat
             )](https://developer.apple.com/swift) [![Cocoapod](https://img.shields.io/cocoapods/v/OAuthReactiveSwift.svg?style=flat)](http://cocoadocs.org/docsets/OAuthReactiveSwift/)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

Utility methods to produce `SignalProducer` from [ReactiveSwift](https://github.com/ReactiveCocoa/ReactiveSwift) framework when authentifying  with [OAuthSwift](https://github.com/OAuthSwift/OAuthSwift).

## How to use
This framework provide prefixed functions `rac_` on `OAuth1Swift` and `OAuth2Swift` class

```swift
let signalResult = oauthSwift.rac_authorize(...
signalResult.producer // The `SignalProducer`
```

## Installation

### Support Carthage

* Install Carthage (https://github.com/Carthage/Carthage)
* Create Cartfile file
```
github "OAuthSwift/OAuthReactiveSwift"
```
* Run `carthage update`.
* On your application targets’ “General” settings tab, in the “Embedded Binaries” section, drag and drop OAuthReactiveSwift.framework from the Carthage/Build/iOS folder on disk.

### Support CocoaPods

* Podfile

```
use_frameworks!

pod 'OAuthReactiveSwift'
```
