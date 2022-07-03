# Localizable

Ported `Text`, `LocalizedStringKey` from SwiftUI.

Supported: `iOS 8.0+`, `macOS 10.10+`, `Mac Catalyst 13.0+`, `tvOS 9.0+`, `watchOS 2.0+`, `Xcode 10.2+`

## How to use

Create a localizable text with string interpolation without SwiftUI.

```swift
let version = 5.0
let text = Text("Swift version: \(version)")
```

## Extract localizable text from Swift sources

Replace `NSLocalizedString()` with `Text()`, and run `genstrings` with `-SwiftUI`:

```bash
genstrings -SwiftUI -o zsxq/zh-Hans.lproj
```
