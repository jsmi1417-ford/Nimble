// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "Nimble",
    platforms: [
      .macOS(.v10_10), .iOS(.v9), .tvOS(.v9)
    ],
    products: [
        .library(name: "Nimble", targets: ["Nimble"]),
    ],
    dependencies: [
        .package(url: "https://github.com/jsmi1417-ford/CwlPreconditionTesting.git", .branch("master")),
    ],
    targets: [
        .target(
            name: "Nimble", 
            dependencies: [
                .product(name: "CwlPreconditionTesting", package: "CwlPreconditionTesting",
                         condition: .when(platforms: [.macOS, .iOS])),
                .product(name: "CwlPosixPreconditionTesting", package: "CwlPreconditionTesting",
                         condition: .when(platforms: [.tvOS]))
            ],
            exclude: ["Info.plist"]
        ),
        .testTarget(
            name: "NimbleTests", 
            dependencies: ["Nimble"], 
            exclude: ["objc", "Info.plist"]
        ),
    ],
    swiftLanguageVersions: [.v5]
)
