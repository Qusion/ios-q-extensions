Pod::Spec.new do |spec|

  spec.name         = "QExtensions"
  spec.version      = "0.0.4"
  spec.summary      = "Swift common classes and extensions use at Qusion."
  spec.homepage     = "https://github.com/QusionDev/ios-QExtensions/blob/master/README.md"
  spec.license      = {
    :type => 'MIT',
    :file => 'LICENSE'
  }
  spec.author       = { "Tomas Holicky" => "holickytomas@gmail.com" }
  spec.platform     = :ios
  spec.platform     = :ios, "11.0"
  spec.swift_versions = ['5.0']
  spec.source       = { :git => "https://github.com/QusionDev/ios-QExtensions.git", :tag => "#{spec.version}" }
  spec.source_files  = "QExtensions", "QExtensions/**/*.{h,m}"

end
