// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "QExtensions",
    platforms: [.macOS(.v10_12),
    .iOS(.v11),
    .tvOS(.v10),
    .watchOS(.v3)],
    products: [
        .library(name: "QExtensions", targets: ["QExtensions"])
    ],
    targets: [
        .target(name: "QExtensions", path: "QExtensions")
    ],
    swiftLanguageVersions: [.v5]
)
