// swift-tools-version: 5.10

import PackageDescription

let swiftSettings: [SwiftSetting] = [
    .enableExperimentalFeature("StrictConcurrency"),
    .enableUpcomingFeature("ConciseMagicFile"),
    .enableUpcomingFeature("ForwardTrailingClosures"),
    .enableUpcomingFeature("ExistentialAny"),
    .enableUpcomingFeature("ImplicitOpenExistentials"),
    .enableUpcomingFeature("BareSlashRegexLiterals"),
    .enableUpcomingFeature("DeprecateApplicationMain"),
    .enableUpcomingFeature("ImportObjcForwardDeclarations"),
    .enableUpcomingFeature("DisableOutwardActorInference"),
    .enableUpcomingFeature("IsolatedDefaultValues"),
    .enableUpcomingFeature("GlobalConcurrency"),
]

let package = Package(
    name: "TMDB",
    platforms: [
        .iOS(.v17),
        .macOS(.v14),
    ],
    products: [
        .library(
            name: "TMDB",
            targets: [
                "TMDB",
            ]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/pointfreeco/swift-dependencies",
            from: "1.2.2"
        ),
        .package(
            url: "https://github.com/pointfreeco/swift-tagged",
            from: "0.10.0"
        ),
    ],
    targets: [
        .target(
            name: "TMDB",
            dependencies: [
                .product(
                    name: "Dependencies",
                    package: "swift-dependencies"
                ),
                .product(
                    name: "DependenciesMacros",
                    package: "swift-dependencies"
                ),
                .product(
                    name: "Tagged",
                    package: "swift-tagged"
                ),
            ],
            swiftSettings: swiftSettings
        ),
        .testTarget(
            name: "TMDBTests",
            dependencies: [
                "TMDB",
            ],
            swiftSettings: swiftSettings
        ),
    ]
)
