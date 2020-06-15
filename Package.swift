
// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "QExtensions",
    products: [
        .library(name: "QExtensions", targets: ["QExtensions"])
    ],
    targets: [
        .target(name: "QExtensions", path: "QExtensions")
    ]
)
