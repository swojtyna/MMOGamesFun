// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RemoveFavoriteGameUseCase",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        .library(
            name: "RemoveFavoriteGameUseCase",
            targets: ["RemoveFavoriteGameUseCase"]),
    ],
    dependencies: [
        .package(path: "../../Common/DIContainer"),
        .package(path: "../../Repositories/FavoritesRepository"),
    ],
    targets: [
        .target(
            name: "RemoveFavoriteGameUseCase",
            dependencies: [
                "DIContainer",
                "FavoritesRepository",
            ]),
        .testTarget(
            name: "RemoveFavoriteGameUseCaseTests",
            dependencies: ["RemoveFavoriteGameUseCase"]),
    ]
)
