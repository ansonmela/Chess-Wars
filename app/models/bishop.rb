# frozen_string_literal: true

class Bishop < Piece

	def bishop_valid_move?(x_move, y_move)

		if (x_position - x_move).abs == (y_position - y_move).abs
			return true
		else
			return false
		end

		if diagonal_obstructed?(x_move, y_move) == true
			return false
		else
			return true
		end
	end
end
