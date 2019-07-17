Pod::Spec.new do |s|
  s.name             = 'APIResource'
  s.version          = '0.2.0'
  s.summary          = 'APIResource Management Library'
  s.description      = <<-DESC
Management your APIResource with this Library
                       DESC

  s.homepage         = 'https://github.com/onemoonStudio/APIResource'
  # s.screenshots    = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'onemoon' => 'sopthfg@gmail.com' }
  s.source           = { :git => 'https://github.com/onemoonStudio/APIResource.git', :tag => s.version.to_s }
  s.ios.deployment_target = '11.0'
  s.swift_version         = '4.0'
  s.source_files = 'APIResource/Source/**/*'

end
