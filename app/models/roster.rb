class Roster
  include Mongoid::Document

  field :team, type: String
  field :season, type: String
  field :players, type: Array

  belongs_to :team

  def self.find_roster(data)

    season = (data[:season].nil? ? "2008-2009" : data[:season])

    Roster.and(team_id: data[:id], season: season).first
  end

end
