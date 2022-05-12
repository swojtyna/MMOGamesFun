// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GetFavoritesGamesUseCase",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        .library(
            name: "GetFavoritesGamesUseCase",
            targets: ["GetFavoritesGamesUseCase"]),
    ],
    dependencies: [
        .package(path: "../../Common/DIContainer"),
        .package(path: "../../Repositories/GamesRepository"),
        .package(path: "../../Repositories/FavoritesRepository"),
    ],
    targets: [
        .target(
            name: "GetFavoritesGamesUseCase",
            dependencies: [
                "DIContainer",
                "GamesRepository",
                "FavoritesRepository",
            ]),
        .testTarget(
            name: "GetFavoritesGamesUseCaseTests",
            dependencies: ["GetFavoritesGamesUseCase"]),
    ]
)
