import SwiftCompilerPlugin
import SwiftSyntaxMacros

@main
struct HexColorPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        HexColorMacro.self,
        HexUIColorMacro.self,
        HexNSColorMacro.self,
    ]
}
