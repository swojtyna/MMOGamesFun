// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DashboardCoordinatorDomain",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "DashboardCoordinatorDomain",
            targets: ["DashboardCoordinatorDomain"]),
    ],
    dependencies: [
        .package(path: "../../Common/DIContainer"),
        .package(path: "../../Common/Extensions"),
    ],
    targets: [
        .target(
            name: "DashboardCoordinatorDomain",
            dependencies: [
                "DIContainer",
                "Extensions",
            ]),
        .testTarget(
            name: "DashboardCoordinatorDomainTests",
            dependencies: ["DashboardCoordinatorDomain"]),
    ]
)
