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
        .package(path: "../../Common/UnitTestingUtilities"),
        .package(path: "../../UseCases/GetGamesUseCase"),
        .package(path: "../../UseCases/AddFavoriteGameUseCase"),
        .package(path: "../../UseCases/RemoveFavoriteGameUseCase"),
        .package(url: "https://github.com/CombineCommunity/CombineExt.git", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "GamesListScene",
            dependencies: [
                "DIContainer",
                "Extensions",
                "GetGamesUseCase",
                "AddFavoriteGameUseCase",
                "RemoveFavoriteGameUseCase",
                "CombineExt"
            ]),
        .testTarget(
            name: "GamesListSceneTests",
            dependencies: [
                "UnitTestingUtilities",
                "GamesListScene",
            ]),
    ]
)
