class PlayersController < ApplicationController

  def show
    @player = Player.find_player(params)
  end
end
