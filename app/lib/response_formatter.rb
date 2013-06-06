class ResponseFormatter

  def self.format_plays(results, query)
    shots = []
    results.each do |play|
      obj = {}
      obj["shot_id"] = play.id
      obj["coordinates"] = play.coordinates
      obj["result"] = play.result
      obj["shot_type"] = play.shot_type
      obj["period"] = play.period
      shots << obj
    end


    data = {}
    data[:shots] = shots
    data[:player] = {name: query[:player], season: query[:season]}
    data

  end
end
