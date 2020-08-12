# Uncomment the next line to define a global platform for your project
# platform :ios, '12.0'

target 'HomeMovie' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for HomeMovie
    pod 'Alamofire', '~> 4.7'
    pod 'AlamofireObjectMapper', :git => 'https://github.com/RomanPodymov/AlamofireObjectMapper.git', :branch => 'xcode-10-2-fix'
    pod 'JGProgressHUD'
    
  target 'HomeMovieTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'HomeMovieUITests' do
    inherit! :search_paths
    # Pods for testing
  end
  
  post_install do |installer|
      installer.pods_project.targets.each do |target|
          target.build_configurations.each do |config|
              config.build_settings['SWIFT_VERSION'] = '5.0'
          end
      end
  end


end
