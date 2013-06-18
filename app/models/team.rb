class Team

  include Mongoid::Document
  field :abbr, type: String
  field :name, type: String
  field :logo_url, type: String
  field :active, type: Boolean

  def self.fetch_all(season = "2008-2009")
    teams = Team.where(:active.ne => false).to_ary
    team_rosters = []

    teams.each do |team|
      obj = {}
      obj[:team] = team
      roster = Roster.where(team_id: team.id, season: season).first.players
      obj[:roster] = roster
      team_rosters << obj
    end

    team_rosters
    format_response(team_rosters)
  end


  def self.format_response(data)
    teams = []

    data.each do |team|
      obj = {}
      obj["abbr"] = team[:team].abbr
      obj["name"] = team[:team].name
      obj["logo"] = team[:team].logo_url
      obj["roster"] = parse_roster(team[:roster])
      teams << obj
    end
    teams
  end

  def self.parse_roster(roster)
    roster.map {|player| player["name"] }
  end

end
