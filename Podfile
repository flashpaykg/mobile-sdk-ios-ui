# Uncomment the next line to define a global platform for your project
platform :ios, '15.0'
#use_frameworks!
use_modular_headers!
workspace 'mobileSDK.xcworkspace'

#TestClient

TestClientTargets = ["FlashpaySample","FlashpaySampleNL3"]

for targetName in TestClientTargets
  target targetName do
    project './mobileSDK.SampleApp/mobileSDK.SampleApp.xcodeproj'
  end
end

#mSDK iOS

mSDKTargets = ["flashpaySDK", "flashpaySDK_Dev", "mSDK_UI"]
for targetName in mSDKTargets
  target targetName do
    project './mobileSDK.Facade/mobileSDK.Facade.xcodeproj'
    pod 'MsdkCore', '0.10.1'
    pod 'KSCrash', :git => 'https://github.com/FLASHPAY/KSCrash.git'
  end
end
