import SwiftUI

#if canImport(UIKit)
import UIKit
#endif
#if canImport(AppKit)
import AppKit
#endif

@freestanding(expression)
public macro color(hex: String, opacity: Double = 1, in colorSpace: SwiftUI.Color.RGBColorSpace = .sRGB) -> SwiftUI.Color =
    #externalMacro(module: "HexColorMacros", type: "HexColorMacro")

#if canImport(UIKit)
@freestanding(expression)
public macro uiColor(hex: String, alpha: CGFloat = 1) -> UIKit.UIColor = #externalMacro(module: "HexColorMacros", type: "HexUIColorMacro")
@freestanding(expression)
public macro uiColor(displayP3Hex: String, alpha: CGFloat = 1) -> UIKit.UIColor = #externalMacro(module: "HexColorMacros", type: "HexUIColorMacro")
#endif

#if canImport(AppKit)
@freestanding(expression)
public macro nsColor(hex: String, alpha: CGFloat = 1) -> AppKit.NSColor = #externalMacro(module: "HexColorMacros", type: "HexNSColorMacro")
@freestanding(expression)
public macro nsColor(srgbHex: String, alpha: CGFloat = 1) -> AppKit.NSColor = #externalMacro(module: "HexColorMacros", type: "HexNSColorMacro")
@freestanding(expression)
public macro nsColor(displayP3Hex: String, alpha: CGFloat = 1) -> AppKit.NSColor = #externalMacro(module: "HexColorMacros", type: "HexNSColorMacro")
@freestanding(expression)
public macro nsColor(calibratedHex: String, alpha: CGFloat = 1) -> AppKit.NSColor = #externalMacro(module: "HexColorMacros", type: "HexNSColorMacro")
@freestanding(expression)
public macro nsColor(deviceHex: String, alpha: CGFloat = 1) -> AppKit.NSColor = #externalMacro(module: "HexColorMacros", type: "HexNSColorMacro")
#endif
