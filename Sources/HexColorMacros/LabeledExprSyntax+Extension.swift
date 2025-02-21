import SwiftDiagnostics
import SwiftSyntax

extension LabeledExprSyntax {
    func parseRGB() throws(DiagnosticsError) -> (red: Double, green: Double, blue: Double) {
        guard
            let segments = self.expression.as(StringLiteralExprSyntax.self)?.segments,
            segments.count == 1,
            let hex = segments.first?.as(StringSegmentSyntax.self)?.content.text
        else {
            throw .init(node: Syntax(self), message: .notLiteralHex)
        }
        switch HexColorParser.parse(hex: hex) {
        case .success(let rgb):
            return rgb
        case .failure(let error):
            throw .init(node: Syntax(self), message: .from(error))
        }
    }
}
