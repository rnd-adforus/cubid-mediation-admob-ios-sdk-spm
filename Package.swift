// swift-tools-version:5.9
import PackageDescription

let versionInfo = "2.7.1"

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
            checksum: "01e6c460ac1b6e57f0bb798667b45730fb237afa0e2724ed28c133d9961f1b00"
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
