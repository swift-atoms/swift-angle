public import Tagged

extension Angle {

    public struct Sweep<Scalar: BinaryFloatingPoint> {
        public let start: Angle.Radian.Value<Scalar>
        public let amount: Angle.Radian.Value<Scalar>

        public enum Error: Swift.Error, Equatable, Sendable {
            case nonfinite
        }

        public init(start: Angle.Radian.Value<Scalar>, amount: Angle.Radian.Value<Scalar>) throws(Error) {
            guard start.underlying.isFinite, amount.underlying.isFinite,
                  (start.underlying + amount.underlying).isFinite else { throw .nonfinite }
            self.start = .init(_unchecked: start.underlying == 0 ? 0 : start.underlying)
            self.amount = .init(_unchecked: amount.underlying == 0 ? 0 : amount.underlying)
        }

        public var end: Angle.Radian.Value<Scalar> {
            .init(_unchecked: start.underlying + amount.underlying)
        }

        public func reversed() throws(Error) -> Self {
            try Self(start: end, amount: .init(_unchecked: -amount.underlying))
        }
    }
}

extension Angle.Sweep: Equatable {}
extension Angle.Sweep: Hashable where Scalar: Hashable {}
extension Angle.Sweep: Sendable where Scalar: Sendable {}

#if !hasFeature(Embedded)
extension Angle.Sweep {
    private enum CodingKeys: String, CodingKey { case start, amount }
}
extension Angle.Sweep: Encodable where Scalar: Encodable {
    public func encode(to encoder: any Encoder) throws {
        var c = encoder.container(keyedBy: CodingKeys.self)
        try c.encode(start.underlying, forKey: .start)
        try c.encode(amount.underlying, forKey: .amount)
    }
}
extension Angle.Sweep: Decodable where Scalar: Decodable {
    public init(from decoder: any Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        let start = try c.decode(Scalar.self, forKey: .start)
        let amount = try c.decode(Scalar.self, forKey: .amount)
        do { try self.init(start: .init(_unchecked: start), amount: .init(_unchecked: amount)) }
        catch {
            throw DecodingError.dataCorrupted(.init(codingPath: decoder.codingPath,
                debugDescription: "Angular start, amount and endpoint must be finite"))
        }
    }
}
#endif
