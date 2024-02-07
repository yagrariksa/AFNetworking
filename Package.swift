// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "AFNetworking",
    platforms: [
        .iOS("7.0"),
        .macOS("10.9"),
        .watchOS("2.0"),
        .tvOS("9.0")
    ],
    products: [
        .library(
            name: "AFNetworking",
            targets: ["AFNetworking"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "AFNetworking",
            dependencies: [],
            path: "AFNetworking",
            sources: ["AFNetworking.h", "AFURLResponseSerialization.h"],
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath("AFNetworking")
            ],
            linkerSettings: [
                .linkedFramework("Security")
            ]
        ),
        .target(
            name: "Serialization",
            dependencies: [],
            path: "AFNetworking",
            sources: ["AFURLRequestSerialization.h", "AFURLResponseSerialization.h"],
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath("AFNetworking")
            ],
            linkerSettings: [
                .linkedFramework("MobileCoreServices"),
                .linkedFramework("CoreGraphics")
            ]
        ),
        .target(
            name: "Security",
            dependencies: [],
            path: "AFNetworking",
            sources: ["AFSecurityPolicy.h"],
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath("AFNetworking")
            ],
            linkerSettings: [
                .linkedFramework("Security")
            ]
        ),
        .target(
            name: "Reachability",
            dependencies: [],
            path: "AFNetworking",
            sources: ["AFNetworkReachabilityManager.h"],
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath("AFNetworking")
            ],
            linkerSettings: [
                .linkedFramework("SystemConfiguration")
            ]
        ),
        .target(
            name: "NSURLSession",
            dependencies: ["Serialization", "Security", "Reachability"],
            path: "AFNetworking",
            sources: ["AFURLSessionManager.h", "AFHTTPSessionManager.h"],
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath("AFNetworking")
            ]
        ),
        .target(
            name: "UIKit",
            dependencies: ["NSURLSession"],
            path: "UIKit+AFNetworking",
            sources: ["*.h"],
            publicHeadersPath: "."
        )
    ]
)
