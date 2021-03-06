// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GetGamesUseCase",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        .library(
            name: "GetGamesUseCase",
            targets: ["GetGamesUseCase"]),
    ],
    dependencies: [
        .package(path: "../../Common/DIContainer"),
        .package(path: "../../Repositories/GamesRepository"),
        .package(path: "../../Repositories/FavoritesRepository"),
    ],
    targets: [
        .target(
            name: "GetGamesUseCase",
            dependencies: [
                "DIContainer",
                "GamesRepository",
                "FavoritesRepository",
            ]),
        .testTarget(
            name: "GetGamesUseCaseTests",
            dependencies: ["GetGamesUseCase"]),
    ])
