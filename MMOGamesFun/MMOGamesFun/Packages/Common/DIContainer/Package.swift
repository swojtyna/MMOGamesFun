// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DIContainer",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "DIContainer",
            targets: ["DIContainer"]),
    ],
    dependencies: [
        .package(url: "https://github.com/hmlongco/Resolver.git", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "DIContainer",
            dependencies: ["Resolver"]),
        .testTarget(
            name: "DIContainerTests",
            dependencies: ["DIContainer"]),
    ]
)
