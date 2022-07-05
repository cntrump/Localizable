# Localizable

Add localized string key support string interpolation without SwiftUI.

Supported: `iOS 8.0+`, `macOS 10.10+`, `Mac Catalyst 13.0+`, `tvOS 9.0+`, `watchOS 2.0+`, `Xcode 10.2+`

## Why write this

Because `NSLocalizedString` is not support string interpolation:

```swift
let number = 10
NSLocalizedString("number is \(number)", "")
```

Extract `Localizable.strings`:

```bash
genstrings test.swift -o .
```

Content of `Localizable.strings`:

```
/* No comment provided by engineer. */
"number is \(number)" = "number is \(number)";
```

If you using SwiftUI:

```swift
let number = 10
Text("number is \(number)")
```

Extract `Localizable.strings`:

```bash
genstrings test.swift -SwiftUI -o .
```

Content of `Localizable.strings`:

```
/* No comment provided by engineer. */
"number is %@" = "number is %@";
```

You see now, `NSLocalizedString` is not support string interpolation in Swift.

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
