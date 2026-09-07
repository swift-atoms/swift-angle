public import Trigonometry
public import Scale
public import Tagged

extension Tagged::Tagged
where Tag == Angle.Radian, Underlying: BinaryFloatingPoint & Trigonometry.Circular {

    @inlinable
    public static func sin(of angle: Self) -> Scale<1, Underlying> {
        Scale(Underlying.sin(angle.underlying))
    }

    @inlinable
    public static func cos(of angle: Self) -> Scale<1, Underlying> {
        Scale(Underlying.cos(angle.underlying))
    }

    @inlinable
    public static func tan(of angle: Self) -> Scale<1, Underlying> {
        Scale(Underlying.tan(angle.underlying))
    }

    @inlinable
    public var sin: Scale<1, Underlying> { Self.sin(of: self) }

    @inlinable
    public var cos: Scale<1, Underlying> { Self.cos(of: self) }

    @inlinable
    public var tan: Scale<1, Underlying> { Self.tan(of: self) }

    @inlinable
    public static func asin(_ ratio: Scale<1, Underlying>) -> Self {
        Self(_unchecked: Underlying.asin(ratio.value))
    }

    @inlinable
    public static func acos(_ ratio: Scale<1, Underlying>) -> Self {
        Self(_unchecked: Underlying.acos(ratio.value))
    }

    @inlinable
    public static func atan(_ ratio: Scale<1, Underlying>) -> Self {
        Self(_unchecked: Underlying.atan(ratio.value))
    }

}
