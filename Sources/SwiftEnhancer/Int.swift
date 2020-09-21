extension Int {
    init(_ string: String?, default defaultValue: Int) {
        self.init(Int(string ?? "") ?? defaultValue)
    }
}
