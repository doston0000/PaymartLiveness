Pod::Spec.new do |s|  
    s.name              = 'PaymartMyId' # Name for your pod
    s.version           = '0.0.5'
    s.summary           = 'Paymart Liveness integration'
    s.homepage          = 'https://github.com/doston0000/PaymartLiveness.git'

    s.author            = { 'doston' => 'doston0000@bk.ru' }
    s.license = { :type => "MIT", :text => "MIT License" }

    s.platform          = :ios
    # change the source location
    s.source           = { :http => 'https://www.dropbox.com/s/0poteax4pb01n5h/paymartMyId.zip?dl=1' }
    s.ios.deployment_target = '11.0'
    s.ios.vendored_frameworks = 'PaymartMyId.xcframework' 
    s.dependency 'GoogleMLKit/FaceDetection', '3.1.0' # Third Party Dependency
    s.pod_target_xcconfig = { 'VALID_ARCHS' => 'x86_64 armv7 arm64' }
   # s.user_target_xcconfig = {'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'}
end 