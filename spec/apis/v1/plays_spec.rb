require 'spec_helper'


describe Api::V1::PlaysController do

  describe "Retrieving shot location data", :type => :api do

    context "with valid API parameters" do

      before do
        Play.create!(result: "made", season: "2008-2009",
                     coordinates: {x: 23, y: 23},
                     eplayer: {name: "kevin durant"},
                     etype: "layup")
      end

      it "should return shot location coordinates and shot results" do
        get "api/v1/plays.json?season=2008-2009&player=kevin%20durant"

        expect(JSON.parse(last_response.body)).to eq [{"coordinates" => {"x"=>23, "y"=>23}, "result" => "made"}]
      end

      it "should not return results when criteria doesn't match record" do

        get "api/v1/plays.json?season=2010-2011&player=kevin%20durant"
        expect(JSON.parse(last_response.body)).to eq []
      end
    end
  end
end

