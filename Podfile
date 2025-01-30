# Uncomment the next line to define a global platform for your project
platform :ios, '15.6'
#use_frameworks!
use_modular_headers!
workspace 'mobileSDK.xcworkspace'

#TestClient

TestClientTargets = ["FlashpaySample"]

for targetName in TestClientTargets
  target targetName do
    project './mobileSDK.SampleApp/mobileSDK.SampleApp.xcodeproj'
  end
end

#mSDK iOS

mSDKTargets = ["flashpaySDK", "flashpaySDK_Dev"]
for targetName in mSDKTargets
  target targetName do
    project './mobileSDK.Facade/mobileSDK.Facade.xcodeproj'
    pod 'MsdkCore', :path => './MSDKCore/MsdkCore.podspec'
  end
end
