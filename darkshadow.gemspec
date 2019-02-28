lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'darkshadow/version'

Gem::Specification.new do |spec|
  spec.name          = 'darkshadow'
  spec.version       = DarkShadow::VERSION
  spec.authors       = ['EasyIP2023']
  spec.email         = ['vdavis2495@gmail.com']

  spec.summary       = 'This gem is built to help with rapid exploit development in ruby'
  spec.homepage      = 'https://github.com/EasyIP2023/darkshadow'
  spec.license       = 'MIT'

  spec.metadata = { 'documentation_uri' => 'https://vincedav2495.gitbook.io/darkshadow' }

  spec.files = Dir['[A-Z]*', '{bin,ext,lib}/**/*']
  spec.files.reject! { |f| f.match(%r{^(test|spec|features)/}) }

  spec.executables << 'darkshadow'

  spec.require_paths = %w[lib ext]
  spec.extensions = ['ext/extconf.rb']

  spec.add_development_dependency 'bundler', '~> 2'
  spec.add_development_dependency 'rake', '~> 12'
  spec.add_development_dependency 'rspec', '~> 3'

  spec.add_dependency 'colorize', '~> 0'
  spec.add_dependency 'gdb', '~> 0'
  spec.add_dependency 'rex', '~> 2.0'
  spec.add_dependency 'rex-text', '~> 0'
end
