[![RandomKitBigInt](https://github.com/nvzqz/RandomKitBigInt/raw/master/Images/banner.png)](https://github.com/nvzqz/RandomKitBigInt)

RandomKitBigInt allows for random generation of arbitrary-precision integers in
Swift. This is a set of extensions to [BigInt](https://github.com/lorentey/BigInt)
that provide functionality of [RandomKit](https://github.com/nvzqz/RandomKit).

### Compatibility

- Platforms:
    - macOS 10.9+
    - iOS 8.0+
    - watchOS 2.0+
    - tvOS 9.0+
    - Linux
- Xcode 8.0
- Swift 3.0

### Install Using Swift Package Manager
The [Swift Package Manager](https://swift.org/package-manager/) is a
decentralized dependency manager for Swift.

1. Add the project to your `Package.swift`.

    ```swift
    import PackageDescription

    let package = Package(
        name: "MyAwesomeProject",
        dependencies: [
            .Package(url: "https://github.com/nvzqz/RandomKitBigInt.git",
                     majorVersion: 1)
        ]
    )
    ```

2. Import the RandomKitBigInt module.

    ```swift
    import RandomKitBigInt
    ```

### Install Using CocoaPods
[CocoaPods](https://cocoapods.org/) is a centralized dependency manager for
Objective-C and Swift. Go [here](https://guides.cocoapods.org/using/index.html)
to learn more.

1. Add the project to your [Podfile](https://guides.cocoapods.org/using/the-podfile.html).

    ```ruby
    use_frameworks!

    pod 'RandomKitBigInt', '~> 1.0.0'
    ```

    If you want to be on the bleeding edge, replace the last line with:

    ```ruby
    pod 'RandomKitBigInt', :git => 'https://github.com/nvzqz/RandomKitBigInt.git'
    ```

2. Run `pod install` and open the `.xcworkspace` file to launch Xcode.

3. Import the RandomKitBigInt framework.

    ```swift
    import RandomKitBigInt
    ```

### Install Using Carthage
[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency
manager for Objective-C and Swift.

1. Add the project to your [Cartfile](https://github.com/Carthage/Carthage/blob/master/Documentation/Artifacts.md#cartfile).

    ```
    github "nvzqz/RandomKitBigInt"
    ```

2. Run `carthage update` and follow [the additional steps](https://github.com/Carthage/Carthage#getting-started)
   in order to add RandomKitBigInt to your project.

3. Import the RandomKitBigInt framework.

    ```swift
    import RandomKitBigInt
    ```

## License

RandomKit is released under the [MIT License](https://opensource.org/licenses/MIT).
