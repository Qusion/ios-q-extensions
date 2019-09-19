Pod::Spec.new do |spec|

  spec.name         = "QExtensions"
  spec.version      = "0.0.1"
  spec.summary      = "QDev - Tools and extensions."
  spec.homepage     = "http://EXAMPLE/QExtensions"
  spec.license      = "MIT"
  spec.author       = { "Tomas Holicky" => "holickytomas@gmail.com" }
  spec.platform     = :ios
  spec.platform     = :ios, "11.0"
  spec.source       = { :git => "https://github.com/QusionDev/ios-QExtensions.git", :tag => "#{spec.version}" }
  spec.source_files  = "QExtensions", "QExtensions/**/*.{h,m}"

end
