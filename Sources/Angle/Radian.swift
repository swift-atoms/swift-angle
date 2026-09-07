public import Numeric
public import Tagged

public typealias Radian<Scalar> = Angle.Radian.Value<Scalar>

extension Tagged::Tagged where Tag == Angle.Radian, Underlying: BinaryFloatingPoint {

    @inlinable
    public static var zero: Self { Self(_unchecked: .zero) }

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

        public typealias Fraction<let Numerator: Int, let Denominator: Int> = Numeric::Numeric.Fraction<
            Numerator, Denominator, Radian<Scalar>
        >

        @inlinable
        public func fraction<let Numerator: Int, let Denominator: Int>() -> Fraction<
            Numerator, Denominator
        > {
            .init(Radian(_unchecked: .pi * Scalar(Numerator) / Scalar(Denominator)))
        }
    }
}

extension Tagged::Tagged where Tag == Angle.Radian, Underlying: AdditiveArithmetic {

    @inlinable
    public static func + (lhs: Self, rhs: Self) -> Self {
        Self(_unchecked: lhs.underlying + rhs.underlying)
    }

    @inlinable
    public static func - (lhs: Self, rhs: Self) -> Self {
        Self(_unchecked: lhs.underlying - rhs.underlying)
    }
}

extension Tagged::Tagged where Tag == Angle.Radian, Underlying: Swift.Numeric {

    @_disfavoredOverload
    @inlinable
    public static func * (lhs: Self, rhs: Underlying) -> Self {
        Self(_unchecked: lhs.underlying * rhs)
    }

    @_disfavoredOverload
    @inlinable
    public static func * (lhs: Underlying, rhs: Self) -> Self {
        Self(_unchecked: lhs * rhs.underlying)
    }
}

extension Tagged::Tagged where Tag == Angle.Radian, Underlying: FloatingPoint {

    @inlinable
    public static func / (lhs: Self, rhs: Underlying) -> Self {
        Self(_unchecked: lhs.underlying / rhs)
    }
}

extension Tagged::Tagged where Tag == Angle.Radian, Underlying: SignedNumeric {

    @inlinable
    public static prefix func - (value: Self) -> Self {
        value.map { -$0 }
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
