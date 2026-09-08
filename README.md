# Angle

## Directed angular intervals

`Angle.Sweep<Scalar>` owns a finite start angle and signed angular amount, including
complete turns. Its endpoint must also be finite. Unlike a normalized phase, zero
and a complete turn remain different parameterizations. Reversal starts at the
represented endpoint and negates the amount; floating-point rounding means this
is not a bitwise involution for arbitrary inputs. Coding validates the same bounds.

```swift
import Angle
let interval = try Angle.Sweep<Double>(start: .zero, amount: .pi.two)
let backwards = try interval.reversed()
```

This value is intended as a constituent of circular and elliptical arcs. It adds
no curve evaluation, Vector application or Matrix dependency. Native atoms umbrella
build and all 26 selected Angle/Rotation runtime cases passed on My Mac,
2026-09-08 21:27. See the consolidation ledger for the recorded result bundle.
