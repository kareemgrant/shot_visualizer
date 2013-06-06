require 'spec_helper'


describe Api::V1::PlaysController do

  describe "Retrieving shot location data", :type => :api do

    context "with valid API parameters" do

      before do
        @player_data = {"name"=> "kevin durant", "season" => "2008-2009"}
        @play = Play.create!(result: "made", season: "2008-2009",
                     coordinates: {x: 23, y: 23},
                     eplayer: {name: "kevin durant"},
                     etype: "layup", shot_type: "jumper",
                     period: "1")
      end

      it "should return shot location coordinates and shot results" do
        get "api/v1/plays.json?season=2008-2009&player=kevin%20durant"

        play_id = @play["_id"]
        result = [{"coordinates" => {"x"=>23, "y"=>23}, "result" => "made",
                   "period"=> "1", "shot_id" => "#{@play.id}", "shot_type"=> "jumper"}]
        data = {}
        data["player"] = @player_data
        data["shots"] = result

        expect(JSON.parse(last_response.body)).to eq data
      end

      it "should not return results when criteria doesn't match record" do

        get "api/v1/plays.json?season=2010-2011&player=kevin%20durant"
        expect(JSON.parse(last_response.body)).to eq [{"error" => "no results found"}]
      end
    end
  end
end

