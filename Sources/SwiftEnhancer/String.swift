import Foundation

extension String {
    // MARK: Base64

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

    // MARK: Hex

    public var hexStringToByteArray: [UInt8]? {
        let length = count
        if length & 1 != 0 {
            return nil
        }
        var bytes = [UInt8]()
        bytes.reserveCapacity(length / 2)
        var index = startIndex
        for _ in 0 ..< length / 2 {
            let nextIndex = self.index(index, offsetBy: 2)
            if let byte = UInt8(self[index ..< nextIndex], radix: 16) {
                bytes.append(byte)
            } else {
                return nil
            }
            index = nextIndex
        }
        return bytes
    }

    public var isValidHexNumber: Bool {
        let chars = CharacterSet(charactersIn: "0123456789ABCDEF").inverted
        return uppercased().rangeOfCharacter(from: chars) == nil
    }

    // MARK: Date

    @available(OSX 10.12, *)
    internal func toISO8601Date() -> Date? {
        let dateFormatter = ISO8601DateFormatter()
        return dateFormatter.date(from: self)
    }

    // MARK: Text manipulation

    public enum TruncationPosition {
        case leading
        case center
        case trailing
    }

    /**
     Truncates a string if the count is higher then the limit.

     - parameters:
        - limit: The max count of the string. Longer strings then the limit will be truncated.
        - position: The position of the truncated character(s). Default `TruncationPosition.trailing`.
        - characters: The characters to be set as the truncation characters.
     */
    public func truncated(after limit: Int,
                          at position: TruncationPosition = .trailing,
                          with characters: String = "...") -> String {
        guard count > limit else {
            return self
        }

        switch position {
        case .leading:
            return characters + suffix(limit)
        case .center:
            let headCharactersCount = Int(ceil(Float(limit - characters.count) / 2.0))
            let tailCharactersCount = Int(floor(Float(limit - characters.count) / 2.0))
            return "\(prefix(headCharactersCount))\(characters)\(suffix(tailCharactersCount))"
        case .trailing:
            return prefix(limit) + characters
        }
    }

    // MARK: - private Helper Functions

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
