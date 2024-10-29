// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ZKCompoments",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ZKCompoments",
            targets: ["ZKCompoments"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Ekhoo/Device.git", .upToNextMajor(from: "3.7.0")),
        .package(url: "https://github.com/yannickl/DynamicColor", .upToNextMajor(from: "5.0.0"))
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ZKCompoments",
            dependencies: [.byName(name: "Device"), .byName(name: "DynamicColor")]
        ),
        .testTarget(
            name: "ZKCompomentsTests",
            dependencies: ["ZKCompoments"]),
    ],
    swiftLanguageVersions: [.v5]
)
