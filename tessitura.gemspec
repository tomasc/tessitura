# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tessitura/version'

Gem::Specification.new do |spec|
  spec.name          = 'tessitura'
  spec.version       = Tessitura::VERSION
  spec.authors       = ['Tomáš Celizna', 'Asger Behncke Jacobsen']
  spec.email         = ['mail@tomascelizna.com', 'asger@8kilo.com']

  spec.summary       = 'Simple wrapper of Tessitura API.'
  spec.homepage      = 'https://github.com/tomasc/tessitura'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'httparty'
  spec.add_dependency 'oga'

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'minitest-vcr'
  spec.add_development_dependency 'webmock'
end
