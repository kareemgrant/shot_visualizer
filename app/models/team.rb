class Team

  include Mongoid::Document
  field :abbr, type: String
  field :name, type: String
  field :logo_url, type: String

  def self.all
  end

end
