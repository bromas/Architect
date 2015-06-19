Pod::Spec.new do |spec|
  spec.name = 'Architect'
  spec.version = '1.0'
  spec.summary = 'View and constraint generation in swift'
  spec.homepage = 'https://github.com/bromas/Architect'
  spec.license = { :type => 'MIT', :file => 'LICENSE' }
  spec.author = {
    'Brian Thomas' => 'bromas@mail.com',
  }
  spec.social_media_url = 'http://twitter.com/atomos86'
  spec.source = { :git => 'https://github.com/bromas/Architect.git', :tag => "v#{spec.version}" }
  spec.source_files = 'Architect/*.{h,swift}'
  spec.requires_arc = true
  spec.ios.deployment_target = '8.3'
end
