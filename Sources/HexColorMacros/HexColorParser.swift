import Foundation

struct HexColorParser {
    private static let validCharacters = CharacterSet(charactersIn: "0123456789ABCDEF")

    static func parse(hex: String) -> Result<(red: Double, green: Double, blue: Double), Error> {
        let hex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
            .replacingOccurrences(of: "#", with: "")
            .uppercased()
        let hexString: String
        switch hex.count {
        case 3:
            guard hex.unicodeScalars.allSatisfy(validCharacters.contains) else {
                return .failure(.invalidHexString(hex))
            }
            hexString = hex.map { "\($0)\($0)" }.joined()
        case 6:
            guard hex.unicodeScalars.allSatisfy(validCharacters.contains) else {
                return .failure(.invalidHexString(hex))
            }
            hexString = hex
        default:
            return .failure(.invalidHexString(hex))
        }
        var rgb: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgb)
        let redValue = Double((rgb >> 16) & 0xFF) / 255.0
        let greenValue = Double((rgb >> 8) & 0xFF) / 255.0
        let blueValue = Double(rgb & 0xFF) / 255.0
        return .success((redValue, greenValue, blueValue))
    }

    enum Error: Swift.Error {
        case invalidHexString(String)
    }
}
