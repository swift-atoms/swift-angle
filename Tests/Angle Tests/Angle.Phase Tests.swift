import Angle
import Testing

@Suite struct `Angles normalize equivalent turns to the same phase` {
    @Test func `Equivalent turns have the same phase`() {
        #expect(Angle.Phase(degrees: 450) == .quarter)
        #expect(Angle.Phase(degrees: -90) == .threeQuarter)
        #expect(Angle.Phase(degrees: -360) == .zero)
        #expect(Angle.Phase(degrees: 45) == nil)
    }

    @Test func `Every phase round trips through degrees`() {
        for phase in Angle.Phase.allCases {
            #expect(Angle.Phase(degrees: phase.degrees) == phase)
        }
    }
}
