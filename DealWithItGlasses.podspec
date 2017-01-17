Pod::Spec.new do |s|
  s.name         = "DealWithItGlasses"
  s.version      = "0.0.6"
  s.summary      = 'An iOS library containing a programmatic implementation of the deal with it sunglasses UI'
  s.homepage     = "https://github.com/ecerney/DealWithItGlasses"
  s.author             = { "Eric Cerney" => "ecerney@gmail.com" }
      # s.platform     = :ios
      #s.platform     = :ios, "9.0"
      #  When using multiple platforms
  s.ios.deployment_target = "9.0"
      # s.osx.deployment_target = "10.7"
      # s.watchos.deployment_target = "2.0"
      # s.tvos.deployment_target = "9.0"
  s.source       = { :git => "https://github.com/ecerney/DealWithItGlasses.git", :tag => "#{s.version}" }
  s.source_files  = "Sources", "Sources/**/*.{h,m,swift}"
  s.exclude_files = ""
  s.public_header_files = "Sources/**/*.h"
      # s.resource  = "icon.png"
      # s.resources = "Resources/*.png"
  s.requires_arc = true
end
