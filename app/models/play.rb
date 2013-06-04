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

    if data[:player]
      results = shots_by_player(data)
    else
      results = shots_by_team(data)
    end


    # create json obj -> should another object be responsible for this???
    # pass it the results and then I magically get back a well formed json
    # obj
    # hmmm, I think so...

    shots = []

    results.each do |play|
      obj = {}
      obj["coordinates"] = play.coordinates
      obj["result"] = play.result
      shots << obj
    end

    shots
  end

  def self.shots_by_player(data)

    Play.and({"eplayer.name"=>data[:player]},
            {:etype.ne => "free throw"},
            {:season => data[:season]})
            .or({:result => "made"}, {:result => "missed"})
  end

  # def self.shots_by_team(data)
  #   team = data[:team].upcase
  #   binding.pry


  #   Play.or({'teams.home.abbr' => team}, {'teams.away.abbr'=> team})
  #       .and({:etype.ne => "free throw"},{:season => data[:season]})
  #       .or({:result => "made"}, {:result => "missed"})
  # end

end
