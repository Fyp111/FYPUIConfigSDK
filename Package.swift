// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FYPUIConfigSDK",
    platforms: [.iOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "FYPUIConfigSDK",
            targets: ["FYPUIConfigSDK"]),
    ],
    targets: [
        .target(
            name: "FYPUIConfigSDK",
            dependencies: [],
            path: "Sources/FYPUIConfigSDK"
        ),
        .testTarget(
            name: "FYPUIConfigSDKTests",
            dependencies: ["FYPUIConfigSDK"],
            path: "Tests/FYPUIConfigSDKTests"
        )
    ]
)
