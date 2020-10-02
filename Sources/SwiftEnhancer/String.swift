import Foundation

extension String {
    /**
     Converts the base64 encoded string to a decoded string.

     It automatically adds padding with the character "=" if the origin string isn't devidable by 4.

     - returns: Decoded string, or `nil` if decoding failed.
     */
    func fromBase64() -> String? {
        guard let data = Data(base64Encoded: addBase64Padding()) else {
            return nil
        }
        return String(data: data, encoding: .utf8)
    }

    /**
     Encodes a string to a base64 encoded string.

     - returns: The encoded string.
     */
    func toBase64() -> String {
        Data(utf8).base64EncodedString()
    }

    /**
     Adds base64 padding to the string.
     */
    fileprivate func addBase64Padding() -> String {
        let remainder = count % 4
        if remainder > 0 {
            return padding(toLength: count + 4 - remainder, withPad: "=", startingAt: 0)
        }
        return self
    }
}

extension Optional where Wrapped == String {
    /**
     Check is a optional string is either `nil` or when non-nil if it isn't empty.
     */
    var isNilOrEmpty: Bool {
        (self ?? "").isEmpty
    }
}
