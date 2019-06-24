// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "Cockpit",
    products: [
        .library(
            name: "Cockpit",
            targets: ["Cockpit"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Cockpit",
            dependencies: []),
        .testTarget(
            name: "CockpitTests",
            dependencies: ["Cockpit"]),
    ]
)
