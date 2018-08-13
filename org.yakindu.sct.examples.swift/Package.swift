// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "SwiftExample",
    dependencies: [
        .Package(url: "https://github.com/TomasLinhart/SwiftGTK", Version(0, 3, 1))
    ]
)
