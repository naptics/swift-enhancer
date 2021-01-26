public extension Int {
    /**
     Initializes a new Int from a string. If no string is given or the string couldn't cast to a `Int`, the default
     value is set.

     - parameters:
       - string: The string to convert to an `Int`.
       - defaultValue: The default value if the string doesn't contains and element of type `Int`.
     */
    init(_ string: String?, default defaultValue: Int) {
        self.init(Int(string ?? "") ?? defaultValue)
    }
}
