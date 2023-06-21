// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DurationParseStrategy",
    defaultLocalization: "en",
    platforms: [
        .macOS(.v13),
        .iOS(.v15),
        .tvOS(.v15),
        .watchOS(.v8)
    ],
    products: [
        .library(
            name: "DurationParseStrategy",
            targets: ["DurationParseStrategy"]),
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-parsing.git", from: "0.12.1")
    ],
    targets: [
        .target(
            name: "DurationParseStrategy",
            dependencies: [
                .product(name: "Parsing", package: "swift-parsing")
            ],
            resources: [
                .process("Resources")
            ]
        ),
        .testTarget(
            name: "DurationParseStrategyTests",
            dependencies: ["DurationParseStrategy"]
        )
    ]
)
