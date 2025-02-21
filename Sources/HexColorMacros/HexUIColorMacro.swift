import SwiftDiagnostics
import SwiftSyntax
import SwiftSyntaxMacros

public struct HexUIColorMacro: ExpressionMacro {
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) throws(DiagnosticsError) -> ExprSyntax {
        let arguments = node.arguments.map { $0 }
        let (red, green, blue) = try arguments[0].parseRGB()
        let alpha: ExprSyntax = arguments.count > 1 ? arguments[1].expression : "1"
        switch arguments[0].label?.text {
        case "hex":
            return "UIKit.UIColor.init(red: \(raw: red), green: \(raw: green), blue: \(raw: blue), alpha: \(alpha))"
        case "displayP3Hex":
            return "UIKit.UIColor.init(displayP3Red: \(raw: red), green: \(raw: green), blue: \(raw: blue), alpha: \(alpha))"
        default:
            return "UIKit.UIColor.init(red: \(raw: red), green: \(raw: green), blue: \(raw: blue), alpha: \(alpha))"
        }
    }
}
