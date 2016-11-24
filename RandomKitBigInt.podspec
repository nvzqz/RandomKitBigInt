Pod::Spec.new do |s|
    s.name                      = "RandomKitBigInt"
    s.version                   = "1.1.0"
    s.summary                   = "Random generation of arbitrary-precision integers in Swift."
    s.homepage                  = "https://github.com/nvzqz/#{s.name}"
    s.license                   = { :type => "MIT", :file => "LICENSE.md" }
    s.author                    = "Nikolai Vazquez", "Károly Lőrentey"

    s.ios.deployment_target     = "8.0"
    s.osx.deployment_target     = "10.9"
    s.watchos.deployment_target = "2.0"
    s.tvos.deployment_target    = "9.0"

    s.source                    = { :git => "https://github.com/nvzqz/#{s.name}.git", :tag => "v#{s.version}" }
    s.source_files              = "Sources/**/*.swift"

    s.dependency "RandomKit", "~> 2.3.0"
    s.dependency "BigInt", "~> 2.1.1"
end
