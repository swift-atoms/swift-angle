import Tagged
import Tagged_Standard_Library_Integration
import Testing

@testable import Angle

@Suite
struct `Tagged - Angle Arithmetic` {

    @Test
    func `radian + radian`() {
        let r1 = Radian<Double>.pi.full
        let r2 = Radian<Double>.pi.half
        let result = r1 + r2
        let test = result == Radian<Double>.pi.full * 1.5
        #expect(test == true)
    }

    @Test
    func `radian - radian`() {
        let r1 = Radian<Double>.pi.full
        let r2 = Radian<Double>.pi.half
        let result = r1 - r2
        let expected = Radian<Double>.pi.half
        #expect(result == expected)
    }

    @Test
    func `radian scaling by scalar`() {
        let r = Radian<Double>.pi.full
        let result1 = r * 2.0
        let result2 = 2.0 * r
        #expect(result1 == Radian<Double>.pi.two)
        #expect(result2 == Radian<Double>.pi.two)
    }

    @Test
    func `radian division by scalar`() {
        let r = Radian<Double>.pi.full
        let result = r / 2.0
        #expect(result == Radian<Double>.pi.half)
    }

    @Test
    func `degree + degree`() {
        let d1: Degree<Double> = 90.0
        let d2: Degree<Double> = 45.0
        let result = d1 + d2
        #expect(result == 135.0)
    }

    @Test
    func `degree - degree`() {
        let d1: Degree<Double> = 90.0
        let d2: Degree<Double> = 45.0
        let result = d1 - d2
        #expect(result == 45.0)
    }
}

@Suite
struct `Tagged - Angle Zero` {

    @Test
    func `zero for radian`() {
        let zero: Radian<Double> = .zero
        #expect(zero == 0.0)
    }
}
