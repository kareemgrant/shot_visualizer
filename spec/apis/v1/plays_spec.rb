require 'spec_helper'


describe Api::V1::PlaysController do

  describe "Retrieving shot location data", :type => :api do

    context "with valid API call" do
      it "should return shot location coordinates and shot results" do

        Play.create!(result: "made", season: "2008-2009", coordinates: {x: 23, y: 23}, eplayer: {name: "kevin durant"}, etype: "layup")

        get "api/v1/plays/2008-2009/kevin%20durant.json"

        expect(JSON.parse(last_response.body)).to eq [{"coordinates" => {"x"=>23, "y"=>23}, "result" => "made"}]
      end
    end
  end
end

