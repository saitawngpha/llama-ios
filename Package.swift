// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "LlamaCpp",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "LlamaCpp",
            targets: ["LlamaCpp"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "LlamaCpp",
            url: "https://github.com/saitawngpha/llama-ios/releases/download/v1.0.0/Llama.xcframework.zip",
            checksum: "989e95d7eb23d3cfa21b743f234e458c113b81464954339c7fbcf7c8273db2eb"
        )
    ]
)
