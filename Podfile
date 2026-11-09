platform :ios, '15.0'

target 'NaverMapDemo' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for NaverMapDemo
  
  pod 'NMapsMap'
  pod 'NMapsGeometry', '1.0.2'

end

# NMapsMap/NMapsGeometry podspec은 iOS 9.0을 선언하지만 Xcode 27은 15.0 미만 배포 타깃을 빌드하지 않는다.
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      if config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'].to_f < 15.0
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '15.0'
      end
    end
  end
end
