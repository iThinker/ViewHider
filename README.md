# ViewHider

[![CI Status](http://img.shields.io/travis/iThinker/ViewHider.svg?style=flat)](https://travis-ci.org/iThinker/ViewHider)
[![Version](https://img.shields.io/cocoapods/v/ViewHider.svg?style=flat)](http://cocoapods.org/pods/ViewHider)
[![License](https://img.shields.io/cocoapods/l/ViewHider.svg?style=flat)](http://cocoapods.org/pods/ViewHider)
[![Platform](https://img.shields.io/cocoapods/p/ViewHider.svg?style=flat)](http://cocoapods.org/pods/ViewHider)

## Usage

Simply add `VHViewObserver` object to xib/storyboard. 
Connect view that is going to be hidden to `view` property. 
Connect constraints that should be activated when view is hidden to `constraintsToActivate` property.
Connect constraints that should be deactivated when view is hidden to `constraintsToDeactivate` property.
Create one `VHViewObserver` for each view you want to be observed.

## Installation

ViewHider is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "ViewHider"
```

## Author

Roman Temchenko, temchenko.r@gmail.com

## License

ViewHider is available under the MIT license. See the LICENSE file for more info.
