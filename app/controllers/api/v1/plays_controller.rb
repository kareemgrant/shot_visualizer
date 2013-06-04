class Api::V1::PlaysController < Api::V1::BaseController

  def index
    @shots = Play.find_shots(params)
    respond_with @shots
  end

end
