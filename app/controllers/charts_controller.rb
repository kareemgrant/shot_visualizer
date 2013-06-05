class ChartsController < ApplicationController
  layout "charts"

  def index
    gon.shots = Play.find_shots(params)
  end


end
