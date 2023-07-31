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
            checksum: "920e214123b68e79072132ecfacd0fb3b1474ceecee37004bee7cf76c78f6a32"
        ),
        .binaryTarget(
            name: "GoogleMapsBase",
            url: "https://github.com/dodobrands/google-maps-swift-package/releases/download/8.1.0/GoogleMapsBase.xcframework.zip",
            checksum: "1d83ab5310e91ab10b681e49434fa0be7bccbd14ac5164dae656f70cf513e02b"
        ),
        .binaryTarget(
            name: "GoogleMapsCore",
            url: "https://github.com/dodobrands/google-maps-swift-package/releases/download/8.1.0/GoogleMapsCore.xcframework.zip",
            checksum: "e6bea68a0565691486a465835a199236001a3f4302258250cd9897354453d9d1"
        ),
    ]
)
