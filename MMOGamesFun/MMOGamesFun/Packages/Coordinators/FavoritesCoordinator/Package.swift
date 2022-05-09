// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FavoritesCoordinator",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "FavoritesCoordinator",
            targets: ["FavoritesCoordinator"]),
    ],
    dependencies: [
        .package(path: "../../Common/DIContainer"),
        .package(path: "../../Common/Extensions"),
        .package(path: "../../Scenes/FavoritesScene"),
    ],
    targets: [
        .target(
            name: "FavoritesCoordinator",
            dependencies: [
                "DIContainer",
                "Extensions",
                "FavoritesScene"
            ]),
        .testTarget(
            name: "FavoritesCoordinatorTests",
            dependencies: ["FavoritesCoordinator"]),
    ]
)
