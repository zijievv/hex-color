
# Hex Color

A set of Swift macros for type-safe generation of `Color`, `UIColor`, and `NSColor` from hex string values.

## Features

- Easily generate `Color`, `UIColor`, and `NSColor` from hex strings.
- Type-safe implementation ensures you get accurate color objects with no runtime errors.
- Supports hex color codes with or without the leading `#` symbol.
- Case-insensitive hex string support (e.g., `ff0000` and `FF0000` are equivalent).

## Usage

### Importing

Make sure to import the module where you want to use the macro:

```swift
import HexColor
```

### Example Usage

#### `#color(hex:)` for `Color` (SwiftUI)

```swift
let color = #color(hex: "FFF", opacity: 1, in: .sRGB)
// Expands to: Color(.sRGB, red: 1.0, green: 1.0, blue: 1.0, opacity: 1)
```

#### `#uiColor(hex:)` for `UIColor` (UIKit)

```swift
let uiColor = #uiColor(hex: "FF0000", alpha: 1)
// Expands to: UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1)

let uiColorDisplayP3 = #uiColor(displayP3Hex: "FF0000")
// Expands to: UIColor(displayP3Red: 1.0, green: 0.0, blue: 0.0, alpha: 1)
```

#### `#nsColor(hex:)` for `NSColor` (AppKit)

```swift
let nsColor = #nsColor(hex: "00FF00")
// Expands to: NSColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1)
```

### Supported Formats

- `#FFF` or `FFF` (with or without the `#` symbol)
- Full hex format: `#FF0000`, `#00FF00`, etc.

## Installation

### Swift Package Manager

To install this library using Swift Package Manager, add the following to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/zijievv/hex-color.git", from: "0.1.0")
]
```

Or, if you’re using Xcode, you can add the package through **File > Add Packages** and search for the repository URL.

## Contributing

Feel free to fork the repository, create a new branch, and submit pull requests. Contributions are welcome!

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
