class Play
  include Mongoid::Document
  field :period, type: String
  field :seconds,  type: Integer
  field :team,  type: String
  field :etype, type: String
  field :coordinates, type: Hash
  field :points, type: Integer
  field :result, type: String
  field :shot_type, type: String
  field :season, type: String
  field :teams, type: Hash

  belongs_to :game


  def self.find_shots(data)
    results = shots_by_player(data)
    format_response(results)
  end

  def self.shots_by_player(data)

    Play.and({"eplayer.name"=>data[:player]},
            {:etype.ne => "free throw"},
            {:season => data[:season]})
            .or({:result => "made"}, {:result => "missed"})
  end

  def self.format_response(results)
    shots = []
    results.each do |play|
      obj = {}
      obj["coordinates"] = play.coordinates
      obj["result"] = play.result
      shots << obj
    end
    shots
  end

end
