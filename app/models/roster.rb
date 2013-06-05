class Roster
  include Mongoid::Document

  field :team, type: String
  field :season, type: String
  field :players, type: Array

  belongs_to :team

end
