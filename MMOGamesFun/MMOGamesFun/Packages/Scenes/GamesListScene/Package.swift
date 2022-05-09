// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GamesListScene",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "GamesListScene",
            targets: ["GamesListScene"]),
    ],
    dependencies: [
        .package(path: "../../Common/DIContainer"),
        .package(path: "../../Common/Extensions"),
        .package(path: "../../UseCases/GetGamesUseCase"),
    ],
    targets: [
        .target(
            name: "GamesListScene",
            dependencies: [
                "DIContainer",
                "Extensions",
                "GetGamesUseCase"
            ]),
        .testTarget(
            name: "GamesListSceneTests",
            dependencies: ["GamesListScene"]),
    ]
)
