// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Extensions",
    products: [
        .library(
            name: "Extensions",
            targets: ["Extensions"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Extensions",
            dependencies: []),
        .testTarget(
            name: "ExtensionsTests",
            dependencies: ["Extensions"]),
    ]
)
