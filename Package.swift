// swift-tools-version: 6.1

import PackageDescription

let package = Package(
    name: "WelcomeFeature",
    platforms: [
        .macOS(.v15),
        .iOS(.v17),
    ],
    products: [
        .library(
            name: "WelcomeFeature",
            targets: ["WelcomeFeature"]
        ),
        .executable(
            name: "WelcomeFeatureApp",
            targets: ["WelcomeFeatureApp"]
        ),
    ],
    targets: [
        .target(
            name: "WelcomeFeature",
            path: "Sources/WelcomeFeature"
        ),
        .executableTarget(
            name: "WelcomeFeatureApp",
            dependencies: ["WelcomeFeature"],
            path: "Sources/WelcomeFeatureApp"
        ),
        .testTarget(
            name: "WelcomeFeatureTests",
            dependencies: ["WelcomeFeature"],
            path: "Tests/WelcomeFeatureTests"
        ),
    ]
)
