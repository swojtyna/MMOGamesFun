// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FavoritesRepository",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "FavoritesRepository",
            targets: ["FavoritesRepository"]),
    ],
    dependencies: [
        .package(path: "../../Common/DIContainer"),
    ],
    targets: [
        .target(
            name: "FavoritesRepository",
            dependencies: [
                "DIContainer",
            ]),
        .testTarget(
            name: "FavoritesRepositoryTests",
            dependencies: ["FavoritesRepository"]),
    ]
)
