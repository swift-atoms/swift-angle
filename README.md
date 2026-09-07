# Angle

Angle represents an angular quantity with a scalar representation and an explicit degree or radian unit. Conversion uses the scalar's approximation of pi; arithmetic follows that representation, including its rounding and nonfinite values. Angle does not require a coordinate space or a document model.

The `pi`, `right`, `straight`, and `full` factories accept exact Rational coefficients through `fraction(_:)`. Degree coefficients are multiplied exactly before floating-point conversion. Radian coefficients scale the destination format's approximation of pi. Neither result is an exact symbolic angle. Binary scaling avoids overflowing the integer components or prematurely underflowing the coefficient.

`Numeric.Fraction<N, D, Result>` has been removed: it accepted any Result, even with a zero denominator, and did not enforce a fraction relationship. Use the existing arbitrary-precision Rational atom instead. For example, `try Radian<Double>.pi.fraction(Rational(numerator: 1, denominator: 3))` produces an approximate angle with an exact one-third coefficient.

Circular functions require only `Trigonometry.Circular`. Normalization and scalar multiples of pi use Swift floating-point operations and do not require an elementary-function backend. Concrete platform conformances are supplied by the higher Numeric compatibility composition. Angle has no dependency on Numeric or its C shim.

Normalization returns a represented value in [0, 2*pi). If rounding reaches the full-turn endpoint, it selects zero; signed zero is canonicalized to positive zero. Nonfinite angles normalize to NaN. This is floating-point modular reduction, not exact symbolic angle reduction.
