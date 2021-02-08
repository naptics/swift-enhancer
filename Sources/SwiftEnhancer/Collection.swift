extension Collection {
    /**
     Returns the object at the given index, if it exists.

     - note: Use this function to call `list[index]` without checking index out of bounds.

     - parameters:
       - index: The index of the element.
     */
    public subscript(safe index: Index) -> Iterator.Element? {
        indices.contains(index) ? self[index] : nil
    }
}
