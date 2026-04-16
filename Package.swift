// swift-tools-version: 6.1

import PackageDescription

let package = Package(
    name: "WelcomeFeature",
    platforms: [
        .macOS(.v15),
        .iOS(.v17),
    ],
    targets: [
        .target(
            name: "WelcomeFeature",
            path: "Sources/WelcomeFeature"
        ),
        .testTarget(
            name: "WelcomeFeatureTests",
            dependencies: ["WelcomeFeature"],
            path: "Tests/WelcomeFeatureTests"
        ),
    ]
)
