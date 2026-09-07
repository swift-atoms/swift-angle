# Angle

Angle represents an angular quantity with a scalar representation and an explicit degree or radian unit. Conversion uses the scalar's approximation of pi; arithmetic follows that representation, including its rounding and nonfinite values. Angle does not require a coordinate space or a document model.

The `pi`, `right`, `straight`, and `full` factories accept exact Rational coefficients through `fraction(_:)`. Degree coefficients are multiplied exactly before floating-point conversion. Radian coefficients scale the destination format's approximation of pi. Neither result is an exact symbolic angle. Binary scaling avoids overflowing the integer components or prematurely underflowing the coefficient.

`Numeric.Fraction<N, D, Result>` has been removed: it accepted any Result, even with a zero denominator, and did not enforce a fraction relationship. Use the existing arbitrary-precision Rational atom instead. For example, `try Radian<Double>.pi.fraction(Rational(numerator: 1, denominator: 3))` produces an approximate angle with an exact one-third coefficient.

Trigonometry is still being separated from Numeric. It is a remaining dependency boundary, not part of the completed migration.
