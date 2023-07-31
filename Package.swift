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
            checksum: "61e4be6b0e83adc9dd9f3586eb3d9744ccd7eadaba390ea9f4753960f4d96e66"
        ),
        .binaryTarget(
            name: "GoogleMapsBase",
            url: "https://github.com/dodobrands/google-maps-swift-package/releases/download/8.1.0/GoogleMapsBase.xcframework.zip",
            checksum: "6035e02995d910464f0baba03d5baeaf2e789682173329cc30b8106c67435f20"
        ),
        .binaryTarget(
            name: "GoogleMapsCore",
            url: "https://github.com/dodobrands/google-maps-swift-package/releases/download/8.1.0/GoogleMapsCore.xcframework.zip",
            checksum: "74160de1c29168465ef7a92b180ac1a42e6d01647162b2371899c8c50f74e715"
        ),
    ]
)
