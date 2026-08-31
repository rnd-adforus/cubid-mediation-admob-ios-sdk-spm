// swift-tools-version:5.9
import PackageDescription

let versionInfo = "2.6.3"

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
            checksum: "5349d395b1ffff2e00d59a8fec58f3fdde93e5ea8633d78d50c6373c26dc768f"
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
