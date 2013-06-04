class Team

  include Mongoid::Document
  field :abbr, type: String
  field :name, type: String
  field :logo_url, type: String

  def self.fetch_all
    teams = Team.all
    results = format_response(teams)
  end

  def self.format_response(data)
    teams = []

    data.each do |team|
      obj = {}
      obj["abbr"] = team.abbr
      obj["name"] = team.name
      teams << obj
    end
    teams
  end

end
