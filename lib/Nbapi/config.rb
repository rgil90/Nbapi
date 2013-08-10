module Nbapi
	class Config
		attr_accessor :access_token, :uri_events, :uri_boxscore, :uri_leaders, :uri_team_results, :response_format, :uri_teams,
									:uri_standings

		def initialize
			set_defaults
		end

		def set_request_uris
			@uri_leaders 								||= "/nba/leaders/"
			@uri_boxscore 							||= "/nba/boxscore/"
			@uri_events									||= "/events"
			@uri_team_results 					||= "/nba/team/"
			@uri_teams 									||= "/nba/teams"
			@uri_standings 							||= "/nba/standings"
		end

		private 
		def set_defaults
			@access_token 							||= "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxx"
			@response_format 						||= "json"
		end
	end
end