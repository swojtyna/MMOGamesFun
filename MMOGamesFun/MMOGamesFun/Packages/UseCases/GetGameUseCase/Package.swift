// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GetGameUseCase",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "GetGameUseCase",
            targets: ["GetGameUseCase"]),
    ],
    dependencies: [
        .package(path: "../../Common/DIContainer"),
    ],
    targets: [
        .target(
            name: "GetGameUseCase",
            dependencies: ["DIContainer"]),
        .testTarget(
            name: "GetGameUseCaseTests",
            dependencies: ["GetGameUseCase"]),
    ]
)
