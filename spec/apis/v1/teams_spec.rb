require 'spec_helper'

describe Api::V1::TeamsController do

  before do
    @player = Player.create!(name: "john wall")
    @team = Team.create!(abbr: "WAS", name: "Washington Bullets")
    @roster = Roster.create!(season: "2008-2009", team_abbr: "WAS", team_id: @team.id, players: [{name: @player.name, player_id: @player.id}])
  end

  describe "Retrieving team listings", :type => :api do
    it "should a list of teams" do
      get "api/v1/teams.json"
      expect(JSON.parse(last_response.body)).to eq [{"abbr"=> "WAS", "name" => "Washington Bullets", "logo"=> nil, "roster"=>["john wall"]}]
    end
  end
end
