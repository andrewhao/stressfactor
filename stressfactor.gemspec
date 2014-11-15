# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'stressfactor/version'

Gem::Specification.new do |spec|
  spec.name          = "stressfactor"
  spec.version       = Stressfactor::VERSION
  spec.authors       = ["Andrew Hao"]
  spec.email         = ["andrewhao@gmail.com"]
  spec.summary       = %q{GPX library to generate training stress scores from GPX files.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  # See Gemfile
  spec.add_dependency "andrewhao-gpx", "~> 0.7"

  spec.add_development_dependency "pry"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "rspec", "~> 3.1"
  spec.add_development_dependency "thor", "~> 0.19.1"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
