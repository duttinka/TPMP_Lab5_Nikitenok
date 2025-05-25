// swift-tools-version: 5.7.0
import PackageDescription

let package = Package(
    name: "FilmDictionaryApp",
    
    dependencies: [
        // зависимости
    ],
    targets: [
        .target(
            name: "FilmLibrary",
            dependencies: []),
        .executableTarget(
            name: "FilmDictionaryApp",
            dependencies: ["FilmLibrary"]),
        .testTarget(
            name: "FilmDictionaryAppTests",
            dependencies: ["FilmDictionaryApp", "FilmLibrary"]),
    ]
)
