# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "reaper/version"

Gem::Specification.new do |spec|
  spec.name          = "reaper"
  spec.version       = Reaper::VERSION
  spec.authors       = ["EasyIP2023"]
  spec.email         = ["vdavis@siu.edu"]

  spec.summary       = %q{This gem is built to help with rapid exploit development in ruby}
  spec.homepage      = "https://github.com/EasyIP2023/reaper"
  spec.license       = "MIT"

  spec.files = Dir.glob("lib/**/*") + Dir['bin/*']
  spec.files += Dir['[A-Z]*']
  spec.files.reject! { |f| f.match(%r{^(test|spec|features)/}) }

  spec.executables << 'reaper'

  spec.require_paths = ["lib"]
	spec.metadata["yard.run"] = "yri"

  spec.add_dependency "bundler", "~> 1.15"
  spec.add_dependency "rake", "~> 12.0"
  spec.add_dependency "rex-text", '~> 0'
  spec.add_dependency "celluloid", '~> 0'
end
