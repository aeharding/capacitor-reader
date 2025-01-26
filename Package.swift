// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "CapacitorReader",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "CapacitorReader",
            targets: ["ReaderPlugin"])
    ],
    dependencies: [
        .package(url: "https://github.com/ionic-team/capacitor-swift-pm.git", from: "7.0.0")
    ],
    targets: [
        .target(
            name: "ReaderPlugin",
            dependencies: [
                .product(name: "Capacitor", package: "capacitor-swift-pm"),
                .product(name: "Cordova", package: "capacitor-swift-pm")
            ],
            path: "ios/Sources/ReaderPlugin"),
        .testTarget(
            name: "ReaderPluginTests",
            dependencies: ["ReaderPlugin"],
            path: "ios/Tests/ReaderPluginTests")
    ]
)
