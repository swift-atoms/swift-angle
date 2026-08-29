public import Tagged

extension Angle.Radian {

    public typealias Value<Scalar> = Tagged::Tagged<Angle.Radian, Scalar>
}

extension Angle.Degree {

    public typealias Value<Scalar> = Tagged::Tagged<Angle.Degree, Scalar>
}
