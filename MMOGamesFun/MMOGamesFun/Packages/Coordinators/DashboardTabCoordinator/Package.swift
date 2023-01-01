// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DashboardTabCoordinator",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "DashboardTabCoordinator",
            targets: ["DashboardTabCoordinator"]),
    ],
    dependencies: [
        .package(path: "../../Common/DIContainer"),
        .package(path: "../../Common/Extensions"),
        .package(path: "../../Coordinators/DashboardCoordinator"),
    ],
    targets: [
        .target(
            name: "DashboardTabCoordinator",
            dependencies: [
                "DIContainer",
                "Extensions",
                "DashboardCoordinator"
            ]),
        .testTarget(
            name: "DashboardTabCoordinatorTests",
            dependencies: ["DashboardTabCoordinator"]),
    ]
)
