Pod::Spec.new do |s|
	s.name     = 'ANNavigationController'
	s.version  = '1.0.0'
	s.license  = 'MIT'
	s.summary  = 'Safe navigation controller.'
	s.homepage = 'https://github.com/antrix1989/ANNavigationController'
	s.authors  = { 'Sergey Demchenko' => 'antrix1989@gmail.com' }
	s.source   = { :git => 'https://github.com/antrix1989/ANNavigationController.git', :tag => '1.0.0' }
	s.requires_arc = true
	s.ios.deployment_target = '7.0'
	s.source_files = '*.{h,m}'
end

