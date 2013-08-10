require 'json'
require 'httparty'
require 'date'

module Nbapi
	class NbapiClient
		include HTTParty
		base_uri 'https://erikberg.com'
	

		def self.get_events(sport="nba", datetime="20130131", format="#{Nbapi.configuration.response_format}")
			
			eb_response = get(base_uri + "#{Nbapi.configuration.uri_events}.#{format}", 
																		:query => {:sport=>sport, :date=>datetime}, 
																		:headers =>{ "Authorization" => "Bearer #{Nbapi.configuration.access_token}"}
																		)
			if eb_response.success?
				return eb_response
			else
				return eb_response.response
			end
		end

		def self.get_boxscore(event_id="20120621-oklahoma-city-thunder-at-miami-heat", format="#{Nbapi.configuration.response_format}")
			eb_response = get(base_uri + "#{Nbapi.configuration.uri_boxscore}/#{event_id}.#{format}", 
				:headers=>{"Authorization" => "Bearer #{Nbapi.configuration.access_token}"})
		
			if eb_response.success?
				return eb_response	
			end
		end

		def self.get_leaders(category, return_players_ranked_less_than=15, return_qualified=true, season_type="regular")
			eb_response = get(base_uri + "#{Nbapi.configuration.uri_leaders}/#{category}.json", 
												:query => {:limit => return_players_ranked_less_than, :qualified => return_qualified, :season_type => season_type},
												:headers => {"Authorization" => "Bearer #{Nbapi.configuration.access_token}"})
			
			if eb_response.success?
				return eb_response	
			end
		end

		def self.get_team_results(team_id)
			eb_response = get(base_uri + "#{Nbapi.configuration.uri_team_results}/#{team_id}.json",
													:headers => {"Authorization" => "Bearer #{Nbapi.configuration.access_token}"})
			if eb_response.success?
				return eb_response	
			else
				return eb_response.response
			end
		end
		
		def self.get_teams
			eb_response = get(base_uri + "#{Nbapi.configuration.uri_teams}.json",
																		:headers=>{"Authorization" => "Bearer #{Nbapi.configuration.access_token}"})
			if eb_response.success?
				return eb_response	
			end
		end

		def self.get_standings(date="20111225", format="#{Nbapi.configuration.response_format}")
			request_uri = build_standings_uri(date, format)
			eb_response = get(request_uri,
													:headers=>{"Authorization" => "Bearer #{Nbapi.configuration.access_token}"})

			if eb_response.success?
				return eb_response
			else
				return eb_response.response
			end
		end

		private
		def self.build_standings_uri(date, format)
			unless date == "20111225"
				standings_uri_request = base_uri + "#{Nbapi.configuration.uri_standings}/#{date}.#{format}"
			else
				standings_uri_request = base_uri + "#{Nbapi.configuration.uri_standings}.#{format}"
			end

			return standings_uri_request
		end
	end
end