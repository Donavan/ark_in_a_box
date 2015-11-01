# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ark_inabox/version'

Gem::Specification.new do |spec|
  spec.name          = 'ark_inabox'
  spec.version       = ArkInabox::VERSION
  spec.authors       = ['Donavan Stanley']
  spec.email         = ['donavan.stanley@gmail.com']

  spec.summary       = %q{Tools for working with Dockerized Ark servers.}
  spec.homepage      = 'https://github.com/Donavan/ark_in_a_box'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler',    '~> 1.10'
  spec.add_development_dependency 'rake',       '~> 10.0'
  spec.add_development_dependency 'rspec',      '~> 3.3'
  spec.add_development_dependency 'pry'         '~> 0.10'
  spec.add_development_dependency 'pry-byebug'  '~> 3.2'

  spec.add_dependency 'thor', '~> 0.19'
end
