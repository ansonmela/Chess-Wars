# frozen_string_literal: true

class Rook < Piece
  
  # Rooks can move horizontally until they hit an obstruction or the edge of the board
  # Rooks can move vertically until they hit an obstruction or the edge of the board
  # Rooks cannot move diagonally or move in more than one direction in the same turn
  
  def rook_valid_move?(move_to_x, move_to_y)
    #horizontal movement
    if ((self.x_position != move_to_x) && (self.y_position == move_to_y))
      return true
    #vertical movement
    elsif ((self.y_position != move_to_y) && (self.x_position == move_to_x))
    return true
    #diagonal movement not allowed
    elsif ((self.x_position != move_to_x) && (self.y_position != move_to_y))
      return false
    end
  end
end
