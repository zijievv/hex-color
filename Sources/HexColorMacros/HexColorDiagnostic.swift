import SwiftDiagnostics
import SwiftSyntax

enum HexColorDiagnostic: DiagnosticMessage {
    case invalidHexString(String)
    case notLiteralHex

    var severity: DiagnosticSeverity {
        .error
    }

    var message: String {
        switch self {
        case .invalidHexString(let string): "Invalid hex string '\(string)'"
        case .notLiteralHex: "Hex string must be a literal"
        }
    }

    var diagnosticID: MessageID {
        .init(domain: "HexColorMacros", id: self.message)
    }

    static func from(_ error: HexColorParser.Error) -> Self {
        switch error {
        case .invalidHexString(let string):
            .invalidHexString(string)
        }
    }
}

extension DiagnosticsError {
    init(node: Syntax, message: HexColorDiagnostic) {
        self.init(diagnostics: [
            .init(node: node, message: message)
        ])
    }
}
