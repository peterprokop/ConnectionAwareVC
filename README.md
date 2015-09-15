# ConnectionAwareVC
UIViewController subclass which shows user notification if internet connection is lost.
Like this:

![Wait](http://i.imgur.com/Qdbjg72.png)

## Installation

### Cocoapods
- Make sure that you use latest stable Cocoapods version: `pod --version`
- If not, update it: `sudo gem install cocoapods`
- `pod init` in you project root dir
- `nano Podfile`, add:

```
pod 'ConnectionAwareVC'
use_frameworks! 
``` 
- Save it: `ctrl-x`, `y`, `enter`
- `pod update`
- Open generated `.xcworkspace`
- Don't forget to import: `import ConnectionAwareVC`!

## Requirements
- Swift 1.2
- iOS 7.0+ (8.0+ if you use Cocoapods)
- Xcode 6.3+
- This library is dependent on [ReachabilitySwift](https://github.com/ashleymills/Reachability.swift)

## Usage

If you're using CocoaPods, import the library with `import ConnectionAwareVC`
Subclass your view controllers from ConnectionAwareVC.

Also, check out [SwiftOverlays](https://github.com/peterprokop/SwiftOverlays/)
