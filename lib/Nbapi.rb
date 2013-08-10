require 'httparty'
require 'Nbapi/config'
Dir[File.dirname(__FILE__) + '/Nbapi/*.rb'].each { |file| require file }

module Nbapi
  # Your code goes here...
  # def self.configure 
  # 	yield configuration
  # end

  def self.configuration
  	@configuration			||= Nbapi::Config.new
  	@configuration.set_request_uris

  	return @configuration
  end

  # convenience method
  def self.api_client
  	Nbapi::NbapiClient
  end
end
