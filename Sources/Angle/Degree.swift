public import Numeric
public import Real
public import Scale
public import Tagged

public typealias Degree<Scalar> = Angle.Degree.Value<Scalar>

extension Tagged::Tagged where Tag == Angle.Degree, Underlying: BinaryFloatingPoint {

    @inlinable
    public static var zero: Self { Self(_unchecked: 0) }

    @inlinable
    public static var right: Angle.Degree.Right<Underlying> { .init() }

    @inlinable
    public static var straight: Angle.Degree.Straight<Underlying> { .init() }

    @inlinable
    public static var full: Angle.Degree.Full<Underlying> { .init() }
}

extension Tagged::Tagged where Tag == Angle.Degree, Underlying: BinaryFloatingPoint {

    @inlinable
    public static var sixty: Self { Self(_unchecked: 60) }

    @inlinable
    public static var thirty: Self { Self(_unchecked: 30) }
}

extension Angle.Degree {

    public struct Right<Scalar: BinaryFloatingPoint>: Sendable {
        @usableFromInline
        internal init() {}

        @inlinable
        public var full: Degree<Scalar> { Degree(_unchecked: 90) }

        @inlinable
        public var half: Degree<Scalar> { Degree(_unchecked: 45) }

        @inlinable
        public var third: Degree<Scalar> { Degree(_unchecked: 30) }

        @inlinable
        public var quarter: Degree<Scalar> { Degree(_unchecked: 22.5) }

        public typealias Fraction<let Numerator: Int, let Denominator: Int> = Numeric::Numeric.Fraction<
            Numerator, Denominator, Degree<Scalar>
        >

        @inlinable
        public func fraction<let Numerator: Int, let Denominator: Int>() -> Fraction<
            Numerator, Denominator
        > {
            .init(Degree(_unchecked: 90 * Scalar(Numerator) / Scalar(Denominator)))
        }
    }
}

extension Angle.Degree {

    public struct Straight<Scalar: BinaryFloatingPoint>: Sendable {
        @usableFromInline
        internal init() {}

        @inlinable
        public var full: Degree<Scalar> { Degree(_unchecked: 180) }

        @inlinable
        public var half: Degree<Scalar> { Degree(_unchecked: 90) }

        @inlinable
        public var third: Degree<Scalar> { Degree(_unchecked: 60) }

        @inlinable
        public var quarter: Degree<Scalar> { Degree(_unchecked: 45) }

        public typealias Fraction<let Numerator: Int, let Denominator: Int> = Numeric::Numeric.Fraction<
            Numerator, Denominator, Degree<Scalar>
        >

        @inlinable
        public func fraction<let Numerator: Int, let Denominator: Int>() -> Fraction<
            Numerator, Denominator
        > {
            .init(Degree(_unchecked: 180 * Scalar(Numerator) / Scalar(Denominator)))
        }
    }
}

extension Angle.Degree {

    public struct Full<Scalar: BinaryFloatingPoint>: Sendable {
        @usableFromInline
        internal init() {}

        @inlinable
        public var full: Degree<Scalar> { Degree(_unchecked: 360) }

        @inlinable
        public var half: Degree<Scalar> { Degree(_unchecked: 180) }

        @inlinable
        public var third: Degree<Scalar> { Degree(_unchecked: 120) }

        @inlinable
        public var quarter: Degree<Scalar> { Degree(_unchecked: 90) }

        @inlinable
        public var sixth: Degree<Scalar> { Degree(_unchecked: 60) }

        public typealias Fraction<let Numerator: Int, let Denominator: Int> = Numeric::Numeric.Fraction<
            Numerator, Denominator, Degree<Scalar>
        >

        @inlinable
        public func fraction<let Numerator: Int, let Denominator: Int>() -> Fraction<
            Numerator, Denominator
        > {
            .init(Degree(_unchecked: 360 * Scalar(Numerator) / Scalar(Denominator)))
        }
    }
}

extension Tagged::Tagged where Tag == Angle.Degree, Underlying: AdditiveArithmetic {

    @inlinable
    public static func + (lhs: Self, rhs: Self) -> Self {
        Self(_unchecked: lhs.underlying + rhs.underlying)
    }

    @inlinable
    public static func - (lhs: Self, rhs: Self) -> Self {
        Self(_unchecked: lhs.underlying - rhs.underlying)
    }
}

extension Tagged::Tagged where Tag == Angle.Degree, Underlying: Swift.Numeric {

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

extension Tagged::Tagged where Tag == Angle.Degree, Underlying: FloatingPoint {

    @inlinable
    public static func / (lhs: Self, rhs: Underlying) -> Self {
        Self(_unchecked: lhs.underlying / rhs)
    }
}

extension Tagged::Tagged where Tag == Angle.Degree, Underlying: SignedNumeric {

    @inlinable
    public static prefix func - (value: Self) -> Self {
        value.map { -$0 }
    }
}

extension Tagged::Tagged where Tag == Angle.Degree, Underlying: BinaryFloatingPoint {

    @inlinable
    public init(radians: Radian<Underlying>) {
        self.init(_unchecked: radians.underlying * 180 / .pi)
    }
}

extension Tagged::Tagged where Tag == Angle.Degree, Underlying: BinaryFloatingPoint {

    @inlinable
    public var radians: Radian<Underlying> {
        Radian(degrees: self)
    }
}

extension Tagged::Tagged where Tag == Angle.Degree, Underlying == Double {

    @inlinable
    public var sin: Scale<1, Underlying> { radians.sin }

    @inlinable
    public var cos: Scale<1, Underlying> { radians.cos }

    @inlinable
    public var tan: Scale<1, Underlying> { radians.tan }
}

extension Tagged::Tagged where Tag == Angle.Degree, Underlying == Float {

    @inlinable
    public var sin: Scale<1, Underlying> { radians.sin }

    @inlinable
    public var cos: Scale<1, Underlying> { radians.cos }

    @inlinable
    public var tan: Scale<1, Underlying> { radians.tan }
}
