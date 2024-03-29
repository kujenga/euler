// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CodedTriangleNumbers",
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/swiftcsv/SwiftCSV.git", from: "0.8.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .executableTarget(
            name: "CodedTriangleNumbers",
            dependencies: ["SwiftCSV"]),
        .testTarget(
            name: "CodedTriangleNumbersTests",
            dependencies: ["CodedTriangleNumbers"]),
    ]
)
