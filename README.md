# DownCounter

[![CI Status](http://img.shields.io/travis/Holin/DownCounter.svg?style=flat)](https://travis-ci.org/Holin/DownCounter)
[![Version](https://img.shields.io/cocoapods/v/DownCounter.svg?style=flat)](http://cocoapods.org/pods/DownCounter)
[![License](https://img.shields.io/cocoapods/l/DownCounter.svg?style=flat)](http://cocoapods.org/pods/DownCounter)
[![Platform](https://img.shields.io/cocoapods/p/DownCounter.svg?style=flat)](http://cocoapods.org/pods/DownCounter)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

DownCounter is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "DownCounter"
```

## Usage
```swift
import UIKit
import DownCounter

class ViewController: UIViewController {

  var downCounter: DownCounter? = nil

  override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
    downCounter = DownCounter(count: 10, step: 2.0)
    downCounter?.delegate = self
    downCounter?.start()
  }

  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
  }

}

extension ViewController: DownCounterDelegate {
  func update(count: Double) {
    print("ViewController count ", count)
  }

  func finished() {
    print("ViewController finished at ", NSDate().description)

    print("down counter will restart")
    downCounter?.start()

  }
}
```

## Author

Holin, holin.he@gmail.com

## License

DownCounter is available under the MIT license. See the LICENSE file for more info.
