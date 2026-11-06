// swift-tools-version:5.9
import PackageDescription

let versionInfo = "2.7.0"

let package = Package(
    name: "UAdKit",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "UAdKit",
            targets: ["UAdKitTarget", "UAdKitResources"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git",
            "12.4.0"..<"13.6.0"
        )
    ],
    targets: [
        .binaryTarget(
            name: "UAdKit",
            url: "https://nexus.adforus.com/repository/cubid_iOS/UAd/\(versionInfo)/UAdKit-SPM.zip",
            checksum: "86aa8ea8efb91cf2d7d8f8404328d34b365b3066852c3a96c9d07729c62af06b"
        ),
        .target(
            name: "UAdKitTarget",
            dependencies: [
                .target(name: "UAdKit"),
                .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
            ],
            path: "UAdKitTarget"
        ),
        .target(
            name: "UAdKitResources",
            path: "Sources/UAdKitResources",
            resources: [
                .copy("UAdResources.bundle")
            ]
        )
    ]
)
