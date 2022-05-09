// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FavoritesTabCoordinator",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "FavoritesTabCoordinator",
            targets: ["FavoritesTabCoordinator"]),
    ],
    dependencies: [
        .package(path: "../../Common/DIContainer"),
        .package(path: "../../Common/Extensions"),
        .package(path: "../../Coordinators/FavoritesCoordinator"),
    ],
    targets: [
        .target(
            name: "FavoritesTabCoordinator",
            dependencies: [
                "DIContainer",
                "Extensions",
                "FavoritesCoordinator"
            ]),
        .testTarget(
            name: "FavoritesTabCoordinatorTests",
            dependencies: ["FavoritesTabCoordinator"]),
    ]
)
