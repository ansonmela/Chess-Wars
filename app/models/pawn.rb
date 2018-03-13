# frozen_string_literal: true

class Pawn < Piece
  def pawn_valid_move?(x_move, y_move)
    #cannot move horizontally
    return false if horizontal_move?(x_move)
    
    #cannot move backwards
    return false if backwards_move?(y_move)
    
    #if pawn is still on starting y-row, then it is allowed to move 2 
        # spaces up (y + 2)
    if pawn_starting_spot
      return true if (self.y_position - y_move).abs == 2
    end
  
    #only allowed to move one space
    if (self.y_position - y_move).abs > 1
      return false
    else
      return true
    end
  
  # Need to add capture_move() method
    if capture_move(x_move, y_move)
      return true
    else
      return false
    end
  end
  
  private
  
  def capture_move(x_move, y_move)
  # Method to allow diagonal movement 1 square forward and to the left 
      #or right for capture
    if landing_square_available?(x_move, y_move)
    Piece.where(x_position: x_move, y_position: y_move, game_id: self.game_id)
                .first.update_attributes(x_position: nil, y_position: nil, 
                captured: true)
    self.update_attributes(x_position: x_move, y_position: y_move)
    end
  end
  
  def horizontal_move?(x_move)
    distance = (self.x_position - x_move).abs
    distance != 0
  end
  
  
  def backwards_move?(y_move)
    color == "black" ? y_position < y_move : y_position > y_move
  end
  
  
  def pawn_starting_spot
    self.y_position == 2 && self.color == "white" || 
    self.y_position == 7 && self.color == "black"
  end
end
