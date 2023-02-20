// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UnitTestingUtilities",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "UnitTestingUtilities",
            targets: ["UnitTestingUtilities"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "UnitTestingUtilities",
            dependencies: []),
    ]
)
