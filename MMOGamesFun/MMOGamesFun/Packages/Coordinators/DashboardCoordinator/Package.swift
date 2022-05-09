// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DashboardCoordinator",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "DashboardCoordinator",
            targets: ["DashboardCoordinator"]),
    ],
    dependencies: [
        .package(path: "../../Common/DIContainer"),
        .package(path: "../../Common/Extensions"),
        .package(path: "../../Coordinators/GamesListCoordinator"),
        .package(path: "../../Coordinators/DashboardCoordinatorDomain"),
        .package(path: "../../Scenes/DashboardScene"),

    ],
    targets: [
        .target(
            name: "DashboardCoordinator",
            dependencies: [
                "DIContainer",
                "Extensions",
                "GamesListCoordinator",
                "DashboardCoordinatorDomain",
                "DashboardScene",
            ]),
        .testTarget(
            name: "DashboardCoordinatorTests",
            dependencies: ["DashboardCoordinator"]),
    ]
)
