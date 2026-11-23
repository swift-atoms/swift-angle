public import Quantity

extension Angle.Radian: Quantity.Kind {
    /// A plane angle is a ratio of two lengths: dimension one.
    public static var dimension: Quantity.Dimension { .one }
}
