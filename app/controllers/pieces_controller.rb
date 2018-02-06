class PiecesController < ApplicationController
skip_before_action :verify_authenticity_token

	def show
		@piece = Piece.find(params[:id])
	end

	def update
		@piece = Piece.find(params[:id])
		@piece.update_attributes(piece_params)
    	redirect_to game_path(@piece.game)
	end

	def edit
		@piece = Piece.find_by_id(params[:id])
		@game = @piece.game
	end


	private

	def piece_params
		params.require(:piece).permit(:x_position, :y_position, :game_id, :color)
	end
end
