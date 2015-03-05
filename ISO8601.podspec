Pod::Spec.new do |spec|
  spec.name = 'ISO8601'
  spec.version = '0.1.2'
  spec.authors = {'Sam Soffes' => 'sam@soff.es'}
  spec.homepage = 'https://github.com/soffes/ISO8601'
  spec.summary = 'ISO8601 date parsing and writing.'
  spec.source = {:git => 'https://github.com/soffes/ISO8601.git', :tag => "v#{spec.version}"}
  spec.license = { :type => 'MIT', :file => 'LICENSE' }

  spec.platforms = :ios, :osx
  spec.requires_arc = true
  spec.frameworks = 'Foundation'
  spec.source_files = 'ISO8601'
end
