# swift-angle

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

Tagged angle values for Swift — radians, degrees, conversion, trigonometry, and angle arithmetic.

`Angle` declares the `Radian` and `Degree` phantom tags; `Radian<Scalar>` and `Degree<Scalar>` are the corresponding `Tagged` value carriers, with degree/radian conversion, trigonometric functions returning `Scale<1, Scalar>` ratios, and intrinsic angle arithmetic.

## Installation

```swift
dependencies: [
    .package(url: "https://github.com/swift-atoms/swift-angle.git", branch: "main"),
]
```

```swift
.target(
    name: "App",
    dependencies: [
        .product(name: "Angle", package: "swift-angle"),
    ]
)
```

## Concepts

```swift
import Angle

let quarter = Radian<Double>.pi.half
let degrees = quarter.degrees

let ratio = quarter.sin
let back = Radian<Double>.asin(ratio)
```

The package contains one product, `Angle`, and depends on `swift-tagged`, `swift-numeric`, and `swift-scale`.

## Community

<!-- BEGIN: discussion -->
*Discussion thread will be created at first public release.*
<!-- END: discussion -->

## License

Apache 2.0. See [LICENSE.md](LICENSE.md).
