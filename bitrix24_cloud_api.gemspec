# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bitrix24_cloud_api/version'

Gem::Specification.new do |spec|
  spec.name          = "bitrix24_cloud_api"
  spec.version       = Bitrix24CloudApi::VERSION
  spec.authors       = ["Viacheslav Gruzdov"]
  spec.email         = ["lucky-@mail.ru"]

  spec.summary       = "Bitrix24 REST API on Ruby"
  spec.description   = "Bitrix24 REST API wrapper (for only cloud version)"
  spec.homepage      = "https://github.com/nononoy/bitrix24_cloud_api"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "oauth2", "~> 1.1"
  spec.add_runtime_dependency "httparty", "~> 0.13.7"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'shoulda-matchers', "~> 2.0"
end
