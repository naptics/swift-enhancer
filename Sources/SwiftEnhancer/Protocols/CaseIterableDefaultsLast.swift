/// A type that provides a collection of all of its values, but provides the last item if no case matches it's raw
/// value.
protocol CaseIterableDefaultsLast: Decodable & CaseIterable & RawRepresentable
    where Self.RawValue: Decodable, Self.AllCases: BidirectionalCollection {}

extension CaseIterableDefaultsLast {
    init(from decoder: Decoder) throws {
        self = try Self(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? Self.allCases.last!
    }
}
