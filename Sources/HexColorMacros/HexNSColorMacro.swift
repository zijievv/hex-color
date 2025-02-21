import SwiftDiagnostics
import SwiftSyntax
import SwiftSyntaxMacros

public struct HexNSColorMacro: ExpressionMacro {
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) throws(DiagnosticsError) -> ExprSyntax {
        let arguments = node.arguments.map { $0 }
        let (red, green, blue) = try arguments[0].parseRGB()
        let alpha = arguments.count > 1 ? arguments[1].expression : "1"
        switch arguments[0].label?.text {
        case "hex":
            return "AppKit.NSColor.init(red: \(raw: red), green: \(raw: green), blue: \(raw: blue), alpha: \(alpha))"
        case "srgbHex":
            return "AppKit.NSColor.init(srgbRed: \(raw: red), green: \(raw: green), blue: \(raw: blue), alpha: \(alpha))"
        case "displayP3Hex":
            return "AppKit.NSColor.init(displayP3Red: \(raw: red), green: \(raw: green), blue: \(raw: blue), alpha: \(alpha))"
        case "calibratedHex":
            return "AppKit.NSColor.init(calibratedRed: \(raw: red), green: \(raw: green), blue: \(raw: blue), alpha: \(alpha))"
        case "deviceHex":
            return "AppKit.NSColor.init(deviceRed: \(raw: red), green: \(raw: green), blue: \(raw: blue), alpha: \(alpha))"
        default:
            return "AppKit.NSColor.init(red: \(raw: red), green: \(raw: green), blue: \(raw: blue), alpha: \(alpha))"
        }
    }
}
