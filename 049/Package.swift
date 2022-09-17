// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PrimePermutations",
    dependencies: [
        .package(path: "../lib/swift/Euler"),
    ],
    targets: [
        .executableTarget(
            name: "PrimePermutations",
            dependencies: [
                "Euler",
            ])
    ]
)
