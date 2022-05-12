// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AddFavoriteGameUseCase",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        .library(
            name: "AddFavoriteGameUseCase",
            targets: ["AddFavoriteGameUseCase"]),
    ],
    dependencies: [
        .package(path: "../../Common/DIContainer"),
        .package(path: "../../Repositories/FavoritesRepository"),
    ],
    targets: [
        .target(
            name: "AddFavoriteGameUseCase",
            dependencies: [
                "DIContainer",
                "FavoritesRepository",
            ]),
        .testTarget(
            name: "AddFavoriteGameUseCaseTests",
            dependencies: ["AddFavoriteGameUseCase"]),
    ]
)
