import Angle
import Testing

@Suite struct `Angle normalization stays within one represented turn` {
    @Test func `Endpoint rounding and signed zero use the zero representative`() {
        #expect(Radian<Double>(-.leastNonzeroMagnitude).normalized.underlying == 0)
        #expect(Radian<Double>(-0.0).normalized.underlying.sign == .plus)
        #expect(Radian<Float16>(Float16.pi * 2).normalized.underlying == 0)
    }

    @Test func `Finite values wrap into a half open turn without a math backend`() {
        let turn = Float16.pi * 2
        for value: Float16 in [-100, -7, -1, 0, 1, 7, 100] {
            let result = Radian<Float16>(value).normalized.underlying
            #expect(result >= 0 && result < turn)
        }
        #expect(Radian<Double>(.infinity).normalized.underlying.isNaN)
    }
}
