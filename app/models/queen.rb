# frozen_string_literal: true

class Queen < Piece
# The queen can be moved any number of unoccupied squares in a straight line vertically, 
# The queen can be moved any number of unoccupied squares in a straight line horizontally, 
# The queen can be moved any number of unoccupied squares in a straight line diagonally,
# The queen captures by occupying the square on which an enemy piece sits.    
    
  def queen_valid_move?(move_to_x, move_to_y)
    #diagonal movement
    if ((self.x_position - move_to_x).abs == (self.y_position - move_to_y).abs)
      return true
    #horizontal movement
    elsif ((self.x_position != move_to_x) && (self.y_position == move_to_y))
      return true
    #vertical movement
    elsif ((self.y_position != move_to_y) && (self.x_position == move_to_x))
      return true
    else
      return false
    end
  end
end
