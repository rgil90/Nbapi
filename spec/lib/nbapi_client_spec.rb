require 'spec_helper'

module Nbapi
	describe Nbapi::NbapiClient do

    before :each do
      Nbapi.configuration.access_token = "ACCESS_TOKEN"
      Nbapi.configuration.response_format = "json"
      @api_client = Nbapi.api_client
    end

		context ".get_from_api" do
      it "should retrieve events from defaults" do
        response = @api_client.fetch({}, "/events")
        response.nil?.should == false
      end

      it "should retrieve the teams with more given uri extensions" do
        response = @api_client.fetch({}, "/nba/teams")
        response.nil?.should == false
      end

      it "should retrieve the league leader in points per game with given params and uri extensions" do
        response = @api_client.fetch({limit: 3, season_type: "post"}, "/nba/leaders/points_per_game")
        response.nil?.should == false
      end
    end
	end
end