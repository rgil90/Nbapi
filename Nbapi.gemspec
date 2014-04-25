# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'Nbapi/version'
require 'Nbapi/config'
Gem::Specification.new do |gem|
  gem.name          = "Nbapi"
  gem.version       = Nbapi::VERSION
  gem.authors       = ["Raul Gil"]
  gem.email         = ["raul.emmanuel.gil@gmail.com"]
  gem.description   = "An api wrapper for the erikberg sports data api"
  gem.summary       = "An api wrapper for the erikberg sports data api"
  gem.homepage      = ""

  gem.files         = Dir["{lib}/**/*.rb", "LICENSE", "*.md"]
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_dependency 'httparty', '~> 0.12.0'
  gem.add_dependency 'json', '~> 1.8.1'
end
