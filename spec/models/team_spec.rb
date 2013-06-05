require 'spec_helper'

describe Team do

  before do
    @player = Player.create!(name: "john wall")
    @team = Team.create!(abbr: "WAS")
    @roster = Roster.create!(season: "2008-2009", team_abbr: "WAS", team_id: @team.id, players: [{name: @player.name, player_id: @player.id}])
  end

  describe "#fetch_all" do
    it "should retreive all teams and their rosters for default season" do
      teams = Team.fetch_all
      expect(teams.first["abbr"]).to eq "WAS"
      expect(teams.first["roster"].first).to eq "john wall"
    end
  end

end
