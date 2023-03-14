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
            url: "https://github.com/dodopizza/google-maps-swift-package/releases/download/7.4.0/GoogleMaps.xcframework.zip",
            checksum: "36ae88850a73a9da82563d0f6053ae3d762f3510e2440034bdc03fc76936eb6f"
        ),
        .binaryTarget(
            name: "GoogleMapsBase",
            url: "https://github.com/dodopizza/google-maps-swift-package/releases/download/7.4.0/GoogleMapsBase.xcframework.zip",
            checksum: "c412d05613165dd939887288f91205486a93da36eac77dc791e26bdf8f2598f7"
        ),
        .binaryTarget(
            name: "GoogleMapsCore",
            url: "https://github.com/dodopizza/google-maps-swift-package/releases/download/7.4.0/GoogleMapsCore.xcframework.zip",
            checksum: "4396d4e685d936d2b32fac24e8aa8d59b377067ffc78cab25a622a12cc8ad1b1"
        ),
    ]
)
