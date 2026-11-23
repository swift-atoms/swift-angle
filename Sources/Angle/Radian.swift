public import Rational
public import Tagged

public typealias Radian<Scalar> = Angle.Radian.Value<Scalar>

extension Tagged::Tagged where Tag == Angle.Radian, Underlying: BinaryFloatingPoint {

    @inlinable
    public static var pi: Angle.Radian.Pi<Underlying> { .init() }
}

extension Angle.Radian {

    public struct Pi<Scalar: BinaryFloatingPoint>: Sendable {
        @usableFromInline
        internal init() {}

        @inlinable
        public var full: Radian<Scalar> { Radian(_unchecked: .pi) }

        @inlinable
        public var half: Radian<Scalar> { Radian(_unchecked: .pi / 2) }

        @inlinable
        public var quarter: Radian<Scalar> { Radian(_unchecked: .pi / 4) }

        @inlinable
        public var two: Radian<Scalar> { Radian(_unchecked: .pi * 2) }

        @inlinable
        public var third: Radian<Scalar> { Radian(_unchecked: .pi / 3) }

        @inlinable
        public var sixth: Radian<Scalar> { Radian(_unchecked: .pi / 6) }

        public func fraction(_ coefficient: Rational) -> Radian<Scalar> {
            let value = coefficient.scaledApproximation(as: Scalar.self)
            return Radian(
                _unchecked: Scalar(
                    sign: .plus,
                    exponent: Scalar.Exponent(clamping: value.exponent),
                    significand: .pi * value.significand
                )
            )
        }
    }
}

extension Tagged::Tagged where Tag == Angle.Radian, Underlying: BinaryFloatingPoint {

    @inlinable
    public init(degrees: Degree<Underlying>) {
        self.init(_unchecked: degrees.underlying * .pi / 180)
    }
}

extension Tagged::Tagged where Tag == Angle.Radian, Underlying: BinaryFloatingPoint {

    @inlinable
    public var degrees: Degree<Underlying> {
        Degree(radians: self)
    }
}
