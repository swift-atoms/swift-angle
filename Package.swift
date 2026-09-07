// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-angle",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(name: "Angle", targets: ["Angle"]),

        .library(name: "Angle Foundation Integration", targets: ["Angle Foundation Integration"]),
        .library(name: "Angle Test Support", targets: ["Angle Test Support"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-atoms/swift-tagged.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-numeric.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-scale.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: "Angle",
            dependencies: [
                .product(name: "Tagged", package: "swift-tagged"),
                .product(name: "Numeric", package: "swift-numeric"),
                .product(name: "Scale", package: "swift-scale"),
            ],
            path: "Sources/Angle"
        ),
        
        .target(
            name: "Angle Foundation Integration",
            dependencies: [
                .target(name: "Angle"),
            ],
            path: "Sources/Angle Foundation Integration"
        ),
        .target(
            name: "Angle Test Support",
            dependencies: [
                .target(name: "Angle"),
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "Angle Tests",
            dependencies: [
                .target(name: "Angle"),
                .product(name: "Tagged", package: "swift-tagged"),
                .product(name: "Numeric", package: "swift-numeric"),
                .product(name: "Scale", package: "swift-scale"),
                .target(name: "Angle Test Support"),
                .target(name: "Angle Foundation Integration"),
            ],
            path: "Tests/Angle Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets {
    target.swiftSettings = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]
}
