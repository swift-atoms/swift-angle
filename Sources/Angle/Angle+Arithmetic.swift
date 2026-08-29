public import Scale
public import Tagged

@inlinable
public func * <Scalar: FloatingPoint>(
    lhs: Angle.Radian.Value<Scalar>,
    rhs: Scale<1, Scalar>
) -> Angle.Radian.Value<Scalar> {
    Tagged::Tagged(_unchecked: lhs.underlying * rhs.value)
}

@inlinable
public func * <Scalar: FloatingPoint>(
    lhs: Scale<1, Scalar>,
    rhs: Angle.Radian.Value<Scalar>
) -> Angle.Radian.Value<Scalar> {
    Tagged::Tagged(_unchecked: lhs.value * rhs.underlying)
}

@inlinable
public func / <Scalar: FloatingPoint>(
    lhs: Angle.Radian.Value<Scalar>,
    rhs: Scale<1, Scalar>
) -> Angle.Radian.Value<Scalar> {
    Tagged::Tagged(_unchecked: lhs.underlying / rhs.value)
}

@inlinable
public func * <Scalar: FloatingPoint>(
    lhs: Angle.Degree.Value<Scalar>,
    rhs: Scale<1, Scalar>
) -> Angle.Degree.Value<Scalar> {
    Tagged::Tagged(_unchecked: lhs.underlying * rhs.value)
}

@inlinable
public func * <Scalar: FloatingPoint>(
    lhs: Scale<1, Scalar>,
    rhs: Angle.Degree.Value<Scalar>
) -> Angle.Degree.Value<Scalar> {
    Tagged::Tagged(_unchecked: lhs.value * rhs.underlying)
}

@inlinable
public func / <Scalar: FloatingPoint>(
    lhs: Angle.Degree.Value<Scalar>,
    rhs: Scale<1, Scalar>
) -> Angle.Degree.Value<Scalar> {
    Tagged::Tagged(_unchecked: lhs.underlying / rhs.value)
}

@inlinable
public func + <Scalar: AdditiveArithmetic>(
    lhs: Angle.Radian.Value<Scalar>,
    rhs: Angle.Radian.Value<Scalar>
) -> Angle.Radian.Value<Scalar> {
    Tagged::Tagged(_unchecked: lhs.underlying + rhs.underlying)
}

@inlinable
public func - <Scalar: AdditiveArithmetic>(
    lhs: Angle.Radian.Value<Scalar>,
    rhs: Angle.Radian.Value<Scalar>
) -> Angle.Radian.Value<Scalar> {
    Tagged::Tagged(_unchecked: lhs.underlying - rhs.underlying)
}

@inlinable
public func + <Scalar: AdditiveArithmetic>(
    lhs: Angle.Degree.Value<Scalar>,
    rhs: Angle.Degree.Value<Scalar>
) -> Angle.Degree.Value<Scalar> {
    Tagged::Tagged(_unchecked: lhs.underlying + rhs.underlying)
}

@inlinable
public func - <Scalar: AdditiveArithmetic>(
    lhs: Angle.Degree.Value<Scalar>,
    rhs: Angle.Degree.Value<Scalar>
) -> Angle.Degree.Value<Scalar> {
    Tagged::Tagged(_unchecked: lhs.underlying - rhs.underlying)
}
