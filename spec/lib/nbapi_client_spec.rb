require 'spec_helper'

module Nbapi
	describe Nbapi::NbapiClient do 
		
		context ".get_events" do 
			it "should get back events" do 
				VCR.use_cassette("nbapi_client/events/basic_events_request") do 
					api_client = Nbapi.api_client
					response = api_client.get_events 
					response.parsed_response["event"].first.nil?.should == false
				end
			end

			it "should not get back events" do 
				VCR.use_cassette("nbapi_client/events/basic_events_request_with_bad_params") do 
					api_client = Nbapi.api_client
					response = api_client.get_events('xxx', 'blah', 'bad-bad')
					response.kind_of?(Net::HTTPNotFound).should == true
				end
			end
		end

		context ".get_boxscore" do 
			it "should get the boxscore" do 
				VCR.use_cassette("nbapi_client/boxscore/basic_boxscore_request") do 
					api_client = Nbapi.api_client
					response = api_client.get_boxscore
					response.parsed_response.nil?.should == false
				end
			end

			it "should not retrieve boxscores" do 
				VCR.use_cassette("nbapi_client/boxscore/basic_boxscore_request_with_bad_params") do 
					api_client = Nbapi.api_client
					response = api_client.get_boxscore("bad-input")
					response.nil?.should == true
				end
			end
		end

		context ".get_leaders" do 
			it "should get the league leaders in points" do 
				VCR.use_cassette("nbapi_client/leaders/basic_leaders_request") do 
					api_client = Nbapi.api_client
					response = api_client.get_leaders("points")
					response.parsed_response.nil?.should == false
					response.parsed_response.length.should == 15
				end
			end

		end

		context ".get_team_results" do 
			it "should get team results" do 
				VCR.use_cassette("nbapi_client/team_results/basic_team_results_request") do 
					api_client = Nbapi.api_client
					response = api_client.get_team_results("oklahoma-city-thunder")
					response.parsed_response.nil?.should == false
				end
			end

			it "should not get team results" do 
				VCR.use_cassette("nbapi_client/team_results/basic_team_results_request_with_bad_params") do 
					api_client = Nbapi.api_client
					response = api_client.get_team_results("bad-input")
					response.kind_of?(Net::HTTPNotFound).should == true
					
				end
			end
		end

		context ".get_teams" do 
			it "should get a list of teams" do 
				VCR.use_cassette("nbapi_client/teams/basic_team_request") do 
					api_client = Nbapi.api_client
					response = api_client.get_teams
					response.parsed_response.nil?.should == false

				end
			end
		end

		context ".get_standings" do 
			it "should get the current nba standings default" do 
				VCR.use_cassette("nbapi_client/standings/basic_standings_request_default") do 
					api_client = Nbapi.api_client
					response = api_client.get_standings
					response.parsed_response.nil?.should == false
				end
			end

			it "should get a time-specified nba standings" do 
				VCR.use_cassette("nbapi_client/standings/time_specified_standings_request") do 
					api_client = Nbapi.api_client
					response = api_client.get_standings("20131225")
					response.parsed_response.nil?.should == false
				end
			end

			it "should not get nba standings" do 
				VCR.use_cassette("nbapi_client/standings/bad_standings_request") do 
					api_client = Nbapi.api_client
					response = api_client.get_standings("20101225", "bad")
					response.kind_of?(Net::HTTPNotFound).should == true
				end
			end
		end
	end
end