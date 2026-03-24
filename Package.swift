// swift-tools-version:5.9
import PackageDescription

let versionInfo = "0.0.0"

let package = Package(
    name: "UAdKit",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "UAdKit",
            targets: ["UAdKit"]
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
            checksum: "b18fed912872dbfe38a8e56255e54435998a2c7927b2079b432ad02e6bd84d1c"
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
