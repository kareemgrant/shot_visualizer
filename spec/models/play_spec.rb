require 'spec_helper'

describe Play do

  before do
    @params = { :player =>"kevin durant",
                :season =>"2008-2009",
                :action =>"index",
                :controller =>"api/v1/plays",
                :format =>"json"}
  end

  describe "#find_shots" do

    it "successfully calls #shots_by_player method" do
      Play.stub(:format_response)
      Play.stub(:shots_by_player).and_return([{:error=>"no results found"}])
      Play.should_receive(:shots_by_player).with(@params)

      Play.find_shots(@params)
    end

  end

  describe "#shots_by_player" do

    context "with valid player specifed in request" do

      before do
        @play = Play.create!(result: "made", season: "2008-2009",
                     coordinates: {x: 23, y: 23},
                     eplayer: {name: "kevin durant"},
                     etype: "layup", shot_type: "jumper",
                     period: "1")
      end

      it "should retrieve the correct record" do
        results = Play.shots_by_player(@params)
        expect(results.size).to eq 1
        expect(results[0].eplayer["name"]).to eq "kevin durant"
      end

    end

    context "when player specified in the request is not found" do

      before do
        @play = Play.create!(result: "made", season: "2008-2009",
                     coordinates: {x: 23, y: 23},
                     eplayer: {name: "kareem grant"},
                     etype: "layup", shot_type: "jumper",
                     period: "1")

      end

      it "should not return a record" do
        results = Play.shots_by_player(@params)
        expect(results[0][:error]).to eq "no results found"
      end
    end

  end

  describe "format_response" do
      before do
        @play = Play.create!(result: "made", season: "2008-2009",
                     coordinates: {x: 23, y: 23},
                     eplayer: {name: "russell westbrook"},
                     etype: "layup", shot_type: "jumper",
                     period: "1")

      end

    it "should successfully call ResponseFormatter method" do
      params = {}
      ResponseFormatter.stub(:format_plays).and_return
      ResponseFormatter.should_receive(:format_plays).with(params, [@play])

      Play.format_response(params, [@play])
    end
  end

end
