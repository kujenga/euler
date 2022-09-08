// swift-tools-version:5.6
import PackageDescription

let package = Package(
  name: "truncatable",
      products: [
        .executable(name: "truncatable", targets: ["truncatable"]),
    ],
  dependencies: [],
  targets: [
    .executableTarget(
      name: "truncatable"
    )
  ]
)
