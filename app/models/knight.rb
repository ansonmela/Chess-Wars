# frozen_string_literal: true

class Knight < Piece
# DETERMINE IF MOVE IS VALID
# KNIGHT CAN MOVE TO 8 PLACES
# EACH PLACE A HORIZONTAL OR VERTICLE L FROM CURRENT POSITION
# CHECK IF OBSTRUCTED
# OBSTRUCTED IF NEW POSITION HAVE PIECE OF SAME COLOR ON IT

  def valid_move?(move_to_x, move_to_y)
    if (self.x_position - move_to_x).abs === 1 && (self.y_position - move_to_y).abs === 2
      return true
    elsif (self.x_position - move_to_x).abs === 2 && (self.y_position - move_to_y).abs === 1
      return true
    else
      return false
    end
  end
end
