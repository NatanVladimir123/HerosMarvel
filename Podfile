# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'ProjComicsMarvel' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for ProjComicsMarvel

pod 'Firebase/Analytics'
pod 'Firebase/Auth'
pod 'Firebase/Firestore'
pod 'Firebase/Storage'
pod 'FirebaseUI/Storage'
pod 'Alamofire'
pod 'Kingfisher', '~> 7.0'
pod 'SwiftHash', git: 'https://github.com/onmyway133/SwiftHash'
  
end

post_install do |installer|
    installer.generated_projects.each do |project|
          project.targets.each do |target|
              target.build_configurations.each do |config|
                  config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
               end
          end
   end
end
