// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HomeTabBarCoordinator",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "HomeTabBarCoordinator",
            targets: ["HomeTabBarCoordinator"]),
    ],
    dependencies: [
        .package(path: "../../Common/DIContainer"),
        .package(path: "../../Common/Extensions"),
        .package(path: "../../Coordinators/DashboardTabCoordinator"),
        .package(path: "../../Coordinators/FavoritesTabCoordinator"),
    ],
    targets: [
        .target(
            name: "HomeTabBarCoordinator",
            dependencies: [
                "DIContainer",
                "Extensions",
                "DashboardTabCoordinator",
                "FavoritesTabCoordinator"
            ]),
        .testTarget(
            name: "HomeTabBarCoordinatorTests",
            dependencies: ["HomeTabBarCoordinator"]),
    ]
)
