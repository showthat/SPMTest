// swift-tools-version:5.8
import PackageDescription

let package = Package(
    name: "MobWithAdMobAdapter",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "MobWithAdMobAdapter",
            targets: ["MobWithAdMobAdapterTarget"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/mobon/MobWithAdSDK_SPM.git", .upToNextMinor(from: "1.3.38")),
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", .upToNextMinor(from: "12.14.0"))
    ],
    targets: [
        .binaryTarget(
            name: "MobWithAdMobAdapter",
            url: "https://github.com/showthat/SPMTest/releases/download/admob-1.0.0/MobWithAdMobAdapter.xcframework.zip",
            checksum: "b016716031de26425f5be67e5e0ca06f742a1bb3be18e1a7e1976e9b8a81bc1e"
        ),
        .target(
            name: "MobWithAdMobAdapterTarget",
            dependencies: [
                .target(name: "MobWithAdMobAdapter"),
                .product(name: "MobWithADSDK", package: "MobWithAdSDK_SPM"),
                .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads")
            ],
            path: "Sources/MobWithAdMobAdapterTarget"
        )
    ]
)
