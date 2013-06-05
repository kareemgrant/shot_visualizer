class ResponseFormatter

  def self.format_plays(results)
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
    shots
  end
end
