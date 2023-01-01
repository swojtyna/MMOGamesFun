// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DashboardScene",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "DashboardScene",
            targets: ["DashboardScene"]),
    ],
    dependencies: [
        .package(path: "../../Common/DIContainer"),
        .package(path: "../../Common/Extensions"),
    ],
    targets: [
        .target(
            name: "DashboardScene",
            dependencies: [
                "DIContainer",
                "Extensions",
            ]),
        .testTarget(
            name: "DashboardSceneTests",
            dependencies: ["DashboardScene"]),
    ]
)
