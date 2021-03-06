// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GamesRepository",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "GamesRepository",
            targets: ["GamesRepository"]),
    ],
    dependencies: [
        .package(path: "../../Common/DIContainer"),
        .package(path: "../../Network/MMOGamesAPI"),
    ],
    targets: [
        .target(
            name: "GamesRepository",
            dependencies: [
                "DIContainer",
                "MMOGamesAPI"
            ]),
        .testTarget(
            name: "GamesRepositoryTests",
            dependencies: ["GamesRepository"]),
    ]
)
