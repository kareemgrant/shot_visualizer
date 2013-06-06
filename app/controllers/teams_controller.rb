class TeamsController < ApplicationController

  def index
    @teams = Team.all.to_ary
  end
end
