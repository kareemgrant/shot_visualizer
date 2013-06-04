require 'spec_helper'

describe Api::V1::TeamsController do

  describe "Retrieving team listings", :type => :api do
    it "should a list of teams" do
      Team.create!(abbr: "WAS", name: "Washington Bullets")
      get "api/v1/teams.json"
      expect(JSON.parse(last_response.body)).to eq [{"abbr"=> "WAS", "name" => "Washington Bullets"}]
    end
  end
end
