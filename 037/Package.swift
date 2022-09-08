// swift-tools-version:5.6
import PackageDescription

let package = Package(
  name: "truncatable",
      products: [
        .executable(name: "truncatable", targets: ["truncatable"]),
    ],
  dependencies: [
    .package(path: "../lib/swift/Euler"),
  ],
  targets: [
    .executableTarget(
      name: "truncatable",
      dependencies: [
        /* .product(name: "Numerics", package: "swift-numerics"), */
        "Euler"
      ]
    )
  ]
)
