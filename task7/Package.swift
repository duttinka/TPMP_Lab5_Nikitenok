// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "task7app",
    dependencies: [
    ],
    targets: [
    
        .executableTarget(
            name: "task7app",
            dependencies: []),
        .testTarget(
            name: "task7appTests",
            dependencies: ["task7app"]),
    ]
)
