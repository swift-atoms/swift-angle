import Tagged
import Testing

@testable import Angle

@Suite
struct `Tagged angles preserve their units through arithmetic` {

    @Test
    func `Adding radians sums their measures`() {
        let r1 = Radian<Double>.pi.full
        let r2 = Radian<Double>.pi.half
        let result = r1 + r2
        let test = result == Radian<Double>.pi.full * 1.5
        #expect(test == true)
    }

    @Test
    func `Subtracting radians computes the difference between their measures`() {
        let r1 = Radian<Double>.pi.full
        let r2 = Radian<Double>.pi.half
        let result = r1 - r2
        let expected = Radian<Double>.pi.half
        #expect(result == expected)
    }

    @Test
    func `Scaling radians multiplies their measure`() {
        let r = Radian<Double>.pi.full
        let result1 = r * 2.0
        let result2 = 2.0 * r
        #expect(result1 == Radian<Double>.pi.two)
        #expect(result2 == Radian<Double>.pi.two)
    }

    @Test
    func `Dividing radians scales their measure`() {
        let r = Radian<Double>.pi.full
        let result = r / 2.0
        #expect(result == Radian<Double>.pi.half)
    }

    @Test
    func `Adding degrees sums their measures`() {
        let d1: Degree<Double> = 90.0
        let d2: Degree<Double> = 45.0
        let result = d1 + d2
        #expect(result == 135.0)
    }

    @Test
    func `Subtracting degrees computes the difference between their measures`() {
        let d1: Degree<Double> = 90.0
        let d2: Degree<Double> = 45.0
        let result = d1 - d2
        #expect(result == 45.0)
    }
}

@Suite
struct `Tagged radians have an additive zero` {

    @Test
    func `Zero radians have a zero measure`() {
        let zero: Radian<Double> = .zero
        #expect(zero == 0.0)
    }
}
