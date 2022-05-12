// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MMOGamesAPI",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        .library(
            name: "MMOGamesAPI",
            targets: ["MMOGamesAPI"]
        ),
    ],
    dependencies: [
        .package(path: "../../Common/DIContainer"),
    ],
    targets: [
        .target(
            name: "MMOGamesAPI",
            dependencies: ["DIContainer"],
            resources:
            [
                .copy("Resources/games.json")
            ]
        ),
        .testTarget(
            name: "MMOGamesAPITests",
            dependencies: ["MMOGamesAPI"]
        ),
    ]
)

// resources: [.copy("Resources")]
