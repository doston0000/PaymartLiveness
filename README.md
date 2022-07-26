PaymartLiveness is library for detecting real person using myid.

- [Installation](#installation)
- [Usage](#usage)
- [License](#license)
## Installation

### CocoaPods
[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate PaymartMyId into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'PaymartMyId'
```
## Usage
```PaymartConfiguration``` contains language modifications, by default selected language is Russian
```swift
//Other available lang options are "uz", "en"
PaymartConfiguration.locale = "ru"
```
You can also set your own words according to your preferred language 
```swift
public var ppTitle: String
public var ppSubtitle: String
public var ppPassportTitle: String
public var ppPlaceholder: String
public var ppDobTitle: String
public var ppDobPlaceholder: String
public var ppBtnTitle: String
public var ppDobDone: String
public var ppDobCancel: String
public var lpTitle: String
public var lpLookTitle: String
public var lpBlinkTitle: String
public var lpSmileTitle: String
```

```PaymartColors``` contains colors that could be changed, names are self descriptive 
```swift
public class PaymartColors {
    public static var buttonBgColor = #colorLiteral(red: 1, green: 0.462745098, blue: 0.262745098, alpha: 1) // FF7643
    public static var buttonActiveTitle = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) // FFFFFF
    public static var buttonInactiveTitle = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) // FFFFFF
    public static var buttonDisable = #colorLiteral(red: 0.3843137255, green: 0.3843137255, blue: 0.3843137255, alpha: 1).withAlphaComponent(0.5)  // 626262
    public static var background = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) // FFFFFF
    public static var calendarColor = #colorLiteral(red: 1, green: 0.462745098, blue: 0.262745098, alpha: 1) // FF7643
    public static var textFieldbackground = #colorLiteral(red: 0.9647058824, green: 0.9647058824, blue: 0.9647058824, alpha: 1) //F6F6F6
    public static var labelBlack = #colorLiteral(red: 0.1176470588, green: 0.1176470588, blue: 0.1176470588, alpha: 1) // 1E1E1E
    public static var loaderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) // FFFFFF
    public static var livenessSuccess = #colorLiteral(red: 0.3254901961, green: 0.8588235294, blue: 0.5490196078, alpha: 1) // 53DB8C
    public static var livenessDefault = #colorLiteral(red: 1, green: 0.462745098, blue: 0.262745098, alpha: 1) // FF7643
    public static var navIconColor = #colorLiteral(red: 0.1176470588, green: 0.1176470588, blue: 0.1176470588, alpha: 1) // 1E1E1E
}
```

Confirm to ```PaymartFaceMatchDelegate``` protocol in order to get final result from liveness controller, if the ```result``` is ```true``` user passed validation through liveness
```swift
public protocol PaymartFaceMatchDelegate : AnyObject {
    func userDidCancel(_ scanViewController: PaymartMyId.PaymartMyIdViewController)
    func userDidComplete(_ scanViewController: PaymartMyId.PaymartMyIdViewController, result: Bool)
}
```

Create ```PaymartMyIdViewController``` by using below method, default ```configuration``` will be used if its not setted and ```token``` should be passed
```swift
public static func createViewController(
withDelegate delegate: PaymartMyId.PaymartFaceMatchDelegate? = nil,
configuration: PaymartMyId.PaymartConfiguration? = nil,
token: String) -> PaymartMyId.PaymartMyIdViewController
```
Set endpoint by using ```PaymartAPIConfig```, available endpoints ```dev``` ```test``` ```production```, by default its in test mode
```swift
PaymartAPIConfig.base = .production
```

Full example 
```swift
import PaymartMyId
import UIKit

class ViewController: UIViewController, PaymartFaceMatchDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
       super.viewDidAppear(animated)
        //set locale
        PaymartConfiguration.locale = "uz"

        //set endpoint
        PaymartAPIConfig.base = .production
        
        //change some ui color
        PaymartColors.calendarColor = .red

        //change some ui text
        let conf = PaymartConfiguration()
        conf.ppSubtitle = "some subtitle"

       //create vc and present it
        let vc = PaymartMyIdViewController.createViewController(
            withDelegate: self,
            configuration: conf,
            token: "sometoken")
    }

    func userDidCancel(_ scanViewController: PaymartMyIdViewController) {
        //user pressed back action 
        scanViewController.dismiss(animated: true)
    }

    func userDidComplete(_ scanViewController: PaymartMyIdViewController, result: Bool) {
         // user completed facematch, dismiss both controllers
         dismiss(animated: true)
          if result {
            // do other actions if user passed validation through liveness
        }
    }
}
```

## License
PaymartLiveness is released under the MIT license. [See LICENSE](https://github.com/Alamofire/Alamofire/blob/master/LICENSE) for details.
