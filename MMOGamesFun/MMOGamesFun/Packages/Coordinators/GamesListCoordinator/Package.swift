// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GamesListCoordinator",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "GamesListCoordinator",
            targets: ["GamesListCoordinator"]),
    ],
    dependencies: [
        .package(path: "../../Common/DIContainer"),
        .package(path: "../../Common/Extensions"),
        .package(path: "../../Scenes/GamesListScene"),
    ],
    targets: [
        .target(
            name: "GamesListCoordinator",
            dependencies: [
                "DIContainer",
                "Extensions",
                "GamesListScene",
            ]),
        .testTarget(
            name: "GamesListCoordinatorTests",
            dependencies: ["GamesListCoordinator"]),
    ]
)
