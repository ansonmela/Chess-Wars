class GamesController < ApplicationController

  def new
    @game = Game.new
  end


  def create
    @game = Game.create_game
    redirect_to game_path(@game)
  end

  def show
    @game = Game.includes(:pieces).find(params[:id])
  end

  private

  def game_params
    params.require(:game).permit(:game_name, :white_player_id, :black_player_id)
  end
end
