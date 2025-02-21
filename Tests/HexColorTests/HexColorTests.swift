import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import XCTest

#if canImport(HexColorMacros)
@testable import HexColorMacros

let testMacros: [String: Macro.Type] = [
    "color": HexColorMacro.self,
    "uiColor": HexUIColorMacro.self,
    "nsColor": HexNSColorMacro.self,
]
#endif

final class HexColorTests: XCTestCase {
    func testHexColorMacro() throws {
        #if canImport(HexColorMacros)
        assertMacroExpansion(
            """
            #color(hex: "FFF", opacity: 1, in: .sRGB)
            """,
            expandedSource: """
                SwiftUI.Color.init(.sRGB, red: 1.0, green: 1.0, blue: 1.0, opacity: 1)
                """,
            macros: testMacros
        )
        #else
        throw XCTSkip("macros are only supported when running tests for the host platform")
        #endif
    }

    func testHexUIColorMacro() throws {
        #if canImport(HexColorMacros)
        assertMacroExpansion(
            """
            #uiColor(hex: "FF0000", alpha: 1)
            #uiColor(displayP3Hex: "FF0000")
            """,
            expandedSource: """
                UIKit.UIColor.init(red: 1.0, green: 0.0, blue: 0.0, alpha: 1)
                UIKit.UIColor.init(displayP3Red: 1.0, green: 0.0, blue: 0.0, alpha: 1)
                """,
            macros: testMacros
        )
        #else
        throw XCTSkip("macros are only supported when running tests for the host platform")
        #endif
    }

    func testHexNSColorMacro() throws {
        #if canImport(HexColorMacros)
        assertMacroExpansion(
            """
            #nsColor(hex: "FF0000", alpha: 1)
            #nsColor(srgbHex: "FF0000")
            #nsColor(displayP3Hex: "FF0000")
            #nsColor(calibratedHex: "FF0000")
            #nsColor(deviceHex: "FF0000")
            """,
            expandedSource: """
                AppKit.NSColor.init(red: 1.0, green: 0.0, blue: 0.0, alpha: 1)
                AppKit.NSColor.init(srgbRed: 1.0, green: 0.0, blue: 0.0, alpha: 1)
                AppKit.NSColor.init(displayP3Red: 1.0, green: 0.0, blue: 0.0, alpha: 1)
                AppKit.NSColor.init(calibratedRed: 1.0, green: 0.0, blue: 0.0, alpha: 1)
                AppKit.NSColor.init(deviceRed: 1.0, green: 0.0, blue: 0.0, alpha: 1)
                """,
            macros: testMacros
        )
        #else
        throw XCTSkip("macros are only supported when running tests for the host platform")
        #endif
    }
}
