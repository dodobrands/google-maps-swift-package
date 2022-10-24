// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "GoogleMaps",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "GoogleMapsBase",
            targets: [
                "GoogleMapsBase"
            ]
        ),
        .library(
            name: "GoogleMapsCore",
            targets: [
                "GoogleMapsCore"
            ]
        ),
        .library(
            name: "GoogleMaps",
            targets: [
                "GoogleMaps",
                "GoogleMapsBase",
                "GoogleMapsCore"
            ]
        ),
    ],
    targets: [
        .binaryTarget(
            name: "GoogleMaps",
            url: "https://github.com/dodopizza/google-maps-swift-package/releases/download/7.1.0/GoogleMaps.xcframework.zip",
            checksum: "896e29a01fb02bb336dcdc4c5790f20dafa8b57d9f16ad4ea40d13bd66f6bf44"
        ),
        .binaryTarget(
            name: "GoogleMapsBase",
            url: "https://github.com/dodopizza/google-maps-swift-package/releases/download/7.1.0/GoogleMapsBase.xcframework.zip",
            checksum: "abdde00b009e88013211bcf9ca7b09825e1362118f789a1b5dc837aff4e591dd"
        ),
        .binaryTarget(
            name: "GoogleMapsCore",
            url: "https://github.com/dodopizza/google-maps-swift-package/releases/download/7.1.0/GoogleMapsCore.xcframework.zip",
            checksum: "9c4ea408dc441df219c1fcaedbef51fa142603c56e918be3fb68f8817aa28507"
        ),
    ]
)
