public extension Optional where Wrapped == String {
    /**
     Check is a optional string is either `nil` or when non-nil if it isn't empty.
     */
    var isNilOrEmpty: Bool {
        (self ?? "").isEmpty
    }
}
