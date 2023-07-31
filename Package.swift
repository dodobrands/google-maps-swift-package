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
            url: "https://github.com/dodobrands/google-maps-swift-package/releases/download/8.1.0/GoogleMaps.xcframework.zip",
            checksum: "fcaad90e6ba638f2ba64fa50a932baff7fb9298f4ffc3e0116cc912fd9c2682f"
        ),
        .binaryTarget(
            name: "GoogleMapsBase",
            url: "https://github.com/dodobrands/google-maps-swift-package/releases/download/8.1.0/GoogleMapsBase.xcframework.zip",
            checksum: "6f4239296d94f50d5bdd3467c00122664626ef2b362c7f3681d8acf82d2eb382"
        ),
        .binaryTarget(
            name: "GoogleMapsCore",
            url: "https://github.com/dodobrands/google-maps-swift-package/releases/download/8.1.0/GoogleMapsCore.xcframework.zip",
            checksum: "230b988abe0d149f4c85a7959de4591421efa5a9c4880c832e7ff07257d82134"
        ),
    ]
)
