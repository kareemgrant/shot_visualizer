class PlayersController < ApplicationController

  def show
    @player = Player.find_player_shots(params)
  end
end
