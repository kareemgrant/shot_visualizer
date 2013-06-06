class ShotChartsController < ApplicationController
  layout "charts"

  def show
    shot_data = Play.find_shots(params)

    @player = shot_data[:player]
    gon.shots = shot_data[:shots]
  end
end
