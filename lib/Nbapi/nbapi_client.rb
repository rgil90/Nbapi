require 'json'
require 'httparty'
require 'date'

module Nbapi
	class NbapiClient
		include HTTParty
		base_uri 'https://erikberg.com'

    def self.fetch(query_params={}, uri_extension)
      unless uri_extension.nil?
        api_response = get(build_api_uri(uri_extension),
                           headers: { "Authorization" => "Bearer #{Nbapi.configuration.access_token}",
                                      "User-Agent" => "#{Nbapi.configuration.user_agent}"},
                           query: query_params)

        unless api_response.success?
          return api_response.parsed_response["error"]
        end
        return api_response.parsed_response
      end

    end


		private
		def self.build_api_uri(uri_extension)
			api_uri = base_uri + "#{uri_extension}.#{Nbapi.configuration.response_format}"
      return api_uri
		end
	end
end