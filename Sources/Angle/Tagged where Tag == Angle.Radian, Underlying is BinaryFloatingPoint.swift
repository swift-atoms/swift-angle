public import Tagged

extension Tagged::Tagged where Tag == Angle.Radian, Underlying: BinaryFloatingPoint {

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
        return Self(_unchecked: result == twoPi || result == 0 ? 0 : result)
    }

    @inlinable
    public var normalized: Self {
        Self.normalized(self)
    }
}
