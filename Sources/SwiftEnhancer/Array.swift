extension Array where Element: Hashable {
    /**
     Subtracting all elements in the array that are contained in another array.

     - parameter otherArray: The other array, which duplicated elements must be subtracted.
     */
    func subtracting(_ otherArray: Array<Element>) -> Array<Element> {
        Array(Set(self).subtracting(otherArray))
    }
}
