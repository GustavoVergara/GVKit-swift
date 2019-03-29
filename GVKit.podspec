#
# Be sure to run `pod lib lint GVKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |spec|
  spec.name             = 'GVKit'
  spec.version          = '5.0.0'
  spec.summary          = 'A small toolbox of extensions and other useful stuff for swift that I use in my projects.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  spec.description      = <<-DESC
  A group of useful code to be reused, always trying to feel just like part of the framework it requires.
  It will feel like it was always there.
                       DESC

  spec.homepage         = 'https://github.com/GustavoVergara/GVKit'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'GustavoVergara' => 'gustavovgarcia.sl@gmail.com' }
  spec.source           = {
      :git => 'https://github.com/GustavoVergara/GVKit.git',
      :tag => spec.version.to_s,
      :submodules => true
  }
  spec.default_subspec = 'NoDependencies'

  spec.swift_version = '5'
  spec.ios.deployment_target = '10.0'


  # spec.source_files = 'GVKit/Classes/Extensions/Foundation/**/*.{swift,h,m}'
  
  # spec.resource_bundles = {
  #   'GVKit' => ['GVKit/Assets/**/*', 'GVKit/Classes/**/*.xib']
  # }
  
  spec.subspec 'Complete' do |subspec|
      subspec.dependency 'GVKit/NoDependencies'
      subspec.dependency 'GVKit/Rx'
      subspec.dependency 'GVKit/Moya'
      subspec.dependency 'GVKit/Alamofire'
  end
  
  spec.subspec 'NoDependencies' do |subspec|
      subspec.dependency 'GVKit/Core'
      subspec.dependency 'GVKit/Foundation'
      subspec.dependency 'GVKit/UIKit'
      subspec.dependency 'GVKit/WebKit'
      subspec.dependency 'GVKit/CoreLocation'
  end

  spec.subspec 'Core' do |subspec|
      subspec.source_files = 'GVKit/Classes/Core/**/*.{swift,h,m}'
  end
  
  spec.subspec 'Foundation' do |subspec|
      subspec.source_files = 'GVKit/Classes/Foundation/**/*.{swift,h,m}'
      
      subspec.frameworks = 'Foundation'
      
      subspec.dependency 'GVKit/Core'
  end
  
  spec.subspec 'UIKit' do |subspec|
      subspec.source_files = 'GVKit/Classes/UIKit/**/*.{swift,h,m}'
      
      subspec.frameworks = 'UIKit'
      
      subspec.dependency 'GVKit/Core'
  end
  
  spec.subspec 'WebKit' do |subspec|
      subspec.source_files = 'GVKit/Classes/WebKit/**/*.{swift,h,m}'
      
      subspec.frameworks = 'WebKit'
      
      subspec.dependency 'GVKit/Core'
  end
  
  spec.subspec 'CoreLocation' do |subspec|
      subspec.source_files = 'GVKit/Classes/CoreLocation/**/*.{swift,h,m}'
      
      subspec.frameworks = 'CoreLocation'
      
      subspec.dependency 'GVKit/Core'
  end
  
  spec.subspec 'Rx' do |subspec|
      subspec.source_files = 'GVKit/Classes/Rx/**/*.{swift,h,m}'
      
      subspec.dependency 'GVKit/Core'
      subspec.dependency 'RxSwift',  '~> 4.4'
      subspec.dependency 'RxCocoa',  '~> 4.4'
  end
  
  spec.subspec 'Moya' do |subspec|
      subspec.source_files = 'GVKit/Classes/Moya/**/*.{swift,h,m}'
      
      subspec.dependency 'GVKit/Core'
      subspec.dependency 'Moya'
  end
  
  spec.subspec 'Alamofire' do |subspec|
      subspec.source_files = 'GVKit/Classes/Alamofire/**/*.{swift,h,m}'
      
      subspec.dependency 'GVKit/Core'
      subspec.dependency 'Alamofire'
  end

end
