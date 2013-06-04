require 'spec_helper'

describe Api::V1::TeamsController do

  describe "Retrieving team listings", :type => :api do

    context "with valid parameters" do
      it "should a list of teams" do
        Play.create!(abbr: "WAS", team_name: "Washington Bullets")

        get "api/v1/teams.json"

        expect(JSON.parse(last_response.body)).to eq [{"abbr"=> "WAS", "name" => "Washington Bullets"}]
      end
    end

  end
end
