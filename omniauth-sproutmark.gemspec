# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-sproutmark/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-sproutmark"
  spec.version       = Omniauth::Sproutmark::VERSION
  spec.authors       = ["Jon McCartie"]
  spec.email         = ["jon@mccartie.com"]
  spec.description   = %q{Omniauth strategy for SproutMark}
  spec.summary       = spec.description
  spec.homepage      = "https://github.com/jmccartie/omniauth-sproutmark"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.test_files       = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "omniauth-oauth2", '~> 1.3.1'

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
