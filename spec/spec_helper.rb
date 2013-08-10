require 'rubygems'
require 'simplecov'
require 'json'
SimpleCov.start do 
	add_filter '/spec/'
end

require 'Nbapi'
Nbapi.configuration.access_token = "263076d4-1d59-4c71-94fd-7df39ee48560"
Nbapi.configuration.response_format = "json"

require 'bundler/setup'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new('spec')

task :default => :spec

require 'vcr'
require 'webmock'

VCR.configure do | c |
  c.cassette_library_dir     	= 'spec/cassettes'
  c.hook_into                	:webmock
  c.default_cassette_options 	= { :record => :new_episodes }
  c.configure_rspec_metadata!
  c.allow_http_connections_when_no_cassette = true
end

RSpec.configure do | c |
  c.treat_symbols_as_metadata_keys_with_true_values = true
end