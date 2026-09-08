import Angle
import Testing
import Foundation

@Suite struct `Directed angular sweep contracts` {
    @Test func `Signed sweeps preserve endpoints and direction`() throws {
        let sweep = try Angle.Sweep<Double>(start: Radian(_unchecked: 5), amount: Radian(_unchecked: -2))
        #expect(sweep.end.underlying == 3)
        let reverse = try sweep.reversed()
        #expect(reverse.start.underlying == 3)
        #expect(reverse.amount.underlying == 2)
        #expect(try reverse.reversed() == sweep)
    }

    @Test func `Full turns are not normalized away`() throws {
        let sweep = try Angle.Sweep<Double>(start: .zero, amount: .pi.two)
        let zero = try Angle.Sweep<Double>(start: .zero, amount: .zero)
        #expect(sweep != zero)
        #expect(sweep.amount.underlying == 2 * Double.pi)
        #expect(Set([sweep, sweep]).count == 1)
    }

    @Test(arguments: [Double.nan, .infinity, -.infinity])
    func `Nonfinite starts and amounts are rejected`(_ value: Double) {
        #expect(throws: Angle.Sweep<Double>.Error.nonfinite) {
            try Angle.Sweep<Double>(start: Radian(_unchecked: value), amount: .zero)
        }
        #expect(throws: Angle.Sweep<Double>.Error.nonfinite) {
            try Angle.Sweep<Double>(start: .zero, amount: Radian(_unchecked: value))
        }
    }

    @Test func `Overflowing endpoints are rejected`() {
        #expect(throws: Angle.Sweep<Double>.Error.nonfinite) {
            try Angle.Sweep<Double>(start: Radian(_unchecked: .greatestFiniteMagnitude),
                                    amount: Radian(_unchecked: .greatestFiniteMagnitude))
        }
    }

    @Test func `Coding revalidates the directed interval`() throws {
        let sweep = try Angle.Sweep<Double>(start: Radian(_unchecked: 1), amount: Radian(_unchecked: -3))
        #expect(try JSONDecoder().decode(Angle.Sweep<Double>.self, from: JSONEncoder().encode(sweep)) == sweep)
        let decoder = JSONDecoder()
        decoder.nonConformingFloatDecodingStrategy = .convertFromString(positiveInfinity: "inf", negativeInfinity: "-inf", nan: "nan")
        #expect(throws: DecodingError.self) {
            try decoder.decode(Angle.Sweep<Double>.self, from: Data(#"{"start":0,"amount":"inf"}"#.utf8))
        }
    }
}
