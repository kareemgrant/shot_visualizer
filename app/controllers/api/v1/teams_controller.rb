class Api::V1::TeamsController < Api::V1::BaseController
  def index
    @teams = Team.fetch_all
    respond_with @teams
  end
end
