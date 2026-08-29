public import Numeric
public import Real
public import Scale
public import Tagged

extension Tagged::Tagged
where Tag == Angle.Radian, Underlying: BinaryFloatingPoint & Numeric::Numeric.Transcendental {

    @inlinable
    public static func sin(of angle: Self) -> Scale<1, Underlying> {
        Scale(Underlying._sin(angle.underlying))
    }

    @inlinable
    public static func cos(of angle: Self) -> Scale<1, Underlying> {
        Scale(Underlying._cos(angle.underlying))
    }

    @inlinable
    public static func tan(of angle: Self) -> Scale<1, Underlying> {
        Scale(Underlying._tan(angle.underlying))
    }

    @inlinable
    public var sin: Scale<1, Underlying> { Self.sin(of: self) }

    @inlinable
    public var cos: Scale<1, Underlying> { Self.cos(of: self) }

    @inlinable
    public var tan: Scale<1, Underlying> { Self.tan(of: self) }

    @inlinable
    public static func asin(_ ratio: Scale<1, Underlying>) -> Self {
        Self(_unchecked: Underlying._asin(ratio.value))
    }

    @inlinable
    public static func acos(_ ratio: Scale<1, Underlying>) -> Self {
        Self(_unchecked: Underlying._acos(ratio.value))
    }

    @inlinable
    public static func atan(_ ratio: Scale<1, Underlying>) -> Self {
        Self(_unchecked: Underlying._atan(ratio.value))
    }

    @inlinable
    public static func pi(over n: Underlying) -> Self {
        Self(_unchecked: Underlying.pi / n)
    }

    @inlinable
    public static func pi(times n: Underlying) -> Self {
        Self(_unchecked: Underlying.pi * n)
    }

    @inlinable
    public static func normalized(_ angle: Self) -> Self {
        let twoPi = Underlying.pi * 2
        var result = angle.underlying.truncatingRemainder(dividingBy: twoPi)
        if result < 0 {
            result += twoPi
        }
        return Self(_unchecked: result)
    }

    @inlinable
    public var normalized: Self {
        Self.normalized(self)
    }
}
