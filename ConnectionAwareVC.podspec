Pod::Spec.new do |s|
  s.name = 'ConnectionAwareVC'
  s.version = '0.2'
  s.license = 'MIT'
  s.summary = 'UIViewController subclass which shows notification if internet connection is lost'
  s.homepage = 'https://github.com/peterprokop/ConnectionAwareVC'
  s.authors = { 'Peter Prokop' => 'prokop.petr@gmail.com' }
  s.source = { :git => 'https://github.com/peterprokop/ConnectionAwareVC.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.requires_arc = 'true'
  s.source_files = 'ConnectionAwareVC/*.swift'
  s.dependency 'ReachabilitySwift', '~> 1.1'
end
