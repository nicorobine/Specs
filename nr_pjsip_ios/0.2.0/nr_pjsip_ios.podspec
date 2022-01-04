#
# Be sure to run `pod lib lint nr_pjsip_ios.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'nr_pjsip_ios'
  s.version          = '0.2.0'
  s.summary          = 'pjsip build for ios'
  s.description      = <<-DESC
                        为 iOS 构建的pjsip, 使用webrtc
                       DESC

  s.homepage         = 'http://www.pjsip.org'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'NicoRobine' => '472150631@qq.com' }
  s.source           = { :git => 'https://github.com/nicorobine/NRPJSIP.git', :tag => s.version.to_s }
  
  s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }

  s.static_framework = true
  s.libraries      = 'stdc++'
  s.requires_arc   = true
  
  s.ios.deployment_target = '9.0'

  s.source_files = 'build_iphone/**/*.{h,hpp}'
  
  s.header_mappings_dir = 'build_iphone'
  
  s.ios.public_header_files = [
                                  'build_iphone/pjlib/headers/**/*.h',
                                  'build_iphone/pjlib-util/headers/**/*.h',
                                  'build_iphone/pjmedia/headers/**/*.h',
                                  'build_iphone/pjnath/headers/**/*.h',
                                  'build_iphone/pjsip/headers/**/*.h',
                                  'build_iphone/pjsip/headers/**/*.hpp'
                                ]
  s.ios.preserve_paths      = [
                                  'build_iphone/pjlib/headers/**/*',
                                  'build_iphone/pjlib-util/headers/**/*',
                                  'build_iphone/pjmedia/headers/**/*',
                                  'build_iphone/pjnath/headers/**/*',
                                  'build_iphone/pjsip/headers/**/*'
                                ]
                                
    s.ios.vendored_libraries  = 'build_iphone/**/*ios.a'
    
    s.ios.frameworks          = 'UIKit', 'VideoToolbox', 'AudioToolbox', 'AVFoundation', 'OpenGLES', 'QuartzCore', 'CoreMedia', 'CoreVideo', 'Network', 'Security'
    
    header_search_paths = [
                            '"$(PODS_ROOT)/Headers/Public/nr_pjsip_ios/pjlib/headers"',
                            '"$(PODS_ROOT)/Headers/Public/nr_pjsip_ios/pjlib-util/headers"',
                            '"$(PODS_ROOT)/Headers/Public/nr_pjsip_ios/pjmedia/headers"',
                            '"$(PODS_ROOT)/Headers/Public/nr_pjsip_ios/pjnath/headers"',
                            '"$(PODS_ROOT)/Headers/Public/nr_pjsip_ios/pjsip/headers"'
                          ]

    s.xcconfig = {
                    'HEADER_SEARCH_PATHS'          => header_search_paths.join(' '),
                    'GCC_PREPROCESSOR_DEFINITIONS' => 'PJ_AUTOCONF=1',
                    'ENABLE_BITCODE' => false
                 }
end
