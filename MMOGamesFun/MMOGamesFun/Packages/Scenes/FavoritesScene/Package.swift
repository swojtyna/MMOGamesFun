// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FavoritesScene",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "FavoritesScene",
            targets: ["FavoritesScene"]),
    ],
    dependencies: [
        .package(path: "../../Common/DIContainer"),
        .package(path: "../../Common/Extensions"),
        .package(path: "../../UseCases/GetFavoritesGamesUseCase"),
        .package(path: "../../UseCases/AddFavoriteGameUseCase"),
        .package(path: "../../UseCases/RemoveFavoriteGameUseCase"),
    ],
    targets: [
        .target(
            name: "FavoritesScene",
            dependencies: [
                "DIContainer",
                "Extensions",
                "GetFavoritesGamesUseCase",
                "AddFavoriteGameUseCase",
                "RemoveFavoriteGameUseCase",
            ]),
        .testTarget(
            name: "FavoritesSceneTests",
            dependencies: ["FavoritesScene"]),
    ]
)
