class RostersController < ApplicationController

  def show
    @roster = Roster.find_roster(params)
  end

end
