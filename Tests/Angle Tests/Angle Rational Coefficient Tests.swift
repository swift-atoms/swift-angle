import Angle
import Rational
import Testing

@Suite struct `Angle factories accept exact rational coefficients` {
    @Test func `Degree factories apply the coefficient to the exact degree measure`() throws {
        let third = try Rational(numerator: 1, denominator: 3)
        #expect(Degree<Double>.right.fraction(third).underlying == 30)
        #expect(Degree<Float>.straight.fraction(third).underlying == 60)
        #expect(Degree<Float16>.full.fraction(third).underlying == 120)
        #expect(Degree<Double>.full.fraction(-third).underlying == -120)
        #expect(Degree<Double>.right.fraction(.zero).underlying == 0)
    }

    @Test func `Radian factories use the destination approximation of pi`() throws {
        let half = try Rational(numerator: 1, denominator: 2)
        #expect(Radian<Double>.pi.fraction(half).underlying == .pi / 2)
        #expect(Radian<Float>.pi.fraction(-half).underlying == -.pi / 2)
        #expect(Radian<Float16>.pi.fraction(.zero).underlying == 0)
    }

    @Test func `Scaling happens before a tiny coefficient can underflow`() throws {
        let coefficient = try Rational(numerator: 1, denominator: powerOfTwo(26))
        #expect(coefficient.approximation(as: Float16.self) == 0)
        #expect(Radian<Float16>.pi.fraction(coefficient).underlying == .leastNonzeroMagnitude)
        #expect(Degree<Float16>.full.fraction(coefficient).underlying == 90 * Float16.leastNonzeroMagnitude)
    }
}

private func powerOfTwo(_ exponent: Int) -> Integer {
    (0..<exponent).reduce(Integer.one) { value, _ in value * 2 }
}
