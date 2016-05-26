import PackageDescription

let package = Package(
    name: "MokuMokuCloud",
    dependencies: [
      .Package(url: "https://github.com/IBM-Swift/Kitura.git", majorVersion: 0, minor: 13),
      .Package(url: "https://github.com/IBM-Swift/HeliumLogger.git", majorVersion: 0, minor: 7)
    ]
)
