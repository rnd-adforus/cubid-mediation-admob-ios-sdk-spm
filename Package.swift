// swift-tools-version:5.9
import PackageDescription

let versionInfo = "2.5.0"

let package = Package(
    name: "UAdKit",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "UAdKit",
            targets: ["UAdKitTarget"]
        ),
    ],
    dependencies: [
        .package(
          url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git",
          "12.4.0"..<"13.0.1"
        )
    ],
    targets: [
        .binaryTarget(
            name: "UAdKit",
            url: "https://nexus.adforus.com/repository/cubid_iOS/UAd/\(versionInfo)/UAdKit.xcframework.zip",
            checksum: "2279b70a0e4cfc79d292101213913e6a1a3440084e7d32caaeaec9d2810ea452"
        ),
        .target(
            name: "UAdKitTarget",
            dependencies: [
                .target(name: "UAdKit"),
                .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
            ],
            path: "UAdKitTarget"
        ),
    ]
)
