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

  def self.fetch(data)
    results = Play.and({"eplayer.name"=>data[:player]},
             {:etype.ne => "free throw"},
             {:season => data[:season]})

    shots = []

    results.each do |play|
      obj = {}
      obj[:coordinates] = play.coordinates
      obj[:result] = play.result
      shots << obj
    end

    shots
  end





end
