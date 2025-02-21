import SwiftDiagnostics
import SwiftSyntax
import SwiftSyntaxMacros

public struct HexColorMacro: ExpressionMacro {
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) throws(DiagnosticsError) -> ExprSyntax {
        let arguments = node.arguments.map { $0 }
        let (red, green, blue) = try arguments[0].parseRGB()
        var opacityExpr: ExprSyntax?
        var colorSpaceExpr: ExprSyntax?
        for argument in arguments.dropFirst() {
            switch argument.label?.text {
            case "opacity":
                opacityExpr = argument.expression
            case "in":
                colorSpaceExpr = argument.expression
            default: break
            }
        }
        let opacity: ExprSyntax = opacityExpr ?? "1"
        let colorSpace: ExprSyntax = colorSpaceExpr ?? ".sRGB"
        return "SwiftUI.Color.init(\(colorSpace), red: \(raw: red), green: \(raw: green), blue: \(raw: blue), opacity: \(opacity))"
    }
}
