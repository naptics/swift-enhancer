import Foundation

public extension CharacterSet {
    /// Returns the character set for characters unreserved for URI components.
    ///
    /// see: https://tools.ietf.org/html/rfc3986#section-2.3
    static let rfc3986Unreserved = CharacterSet.alphanumerics.union(.init(charactersIn: "-._~"))
}
