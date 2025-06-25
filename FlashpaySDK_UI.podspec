#
#  Be sure to run `pod spec lint paymentpage-sdk-ios.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|
  spec.name         = "FlashpaySDK_UI"
  spec.version      = "3.4.1"
  spec.summary      = "Flashpay SDK with UI for iOS"

  spec.description  = "SDK for iOS is a software development kit for fast integration of the flashpaykg payment solutions right in your mobile app for iOS."
  spec.homepage     = "https://github.com/flashpaykg/mobile-sdk-ios-ui"
  spec.license      = "MIT"
 
  spec.authors      = { "Alexey Khrameev"  =>  "a.khrameev@it.flashpay.kg",
                        "Artem Serebrennikov"  =>  "a.serebrennikov@it.flashpay.kg" }

  spec.platform     = :ios
  spec.ios.deployment_target = "14"

  spec.source       = { :http => "https://github.com/flashpaykg/mobile-sdk-ios-ui/releases/download/#{spec.version}/flashpaySDK.xcframework.zip" }

  spec.ios.vendored_frameworks = 'flashpaySDK.xcframework'

end
