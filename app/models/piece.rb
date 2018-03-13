class Piece < ApplicationRecord
  validates :game, presence: true
  belongs_to :game

  def is_obstructed?(new_x, new_y)
    horizontal_obstructed?(new_x) ||
    vertical_obstructed?(new_y) ||
    diagonal_obstructed?(new_x, new_y) ||
    invalid_move?(new_x, new_y)
  end
 
  def move_to!(new_x, new_y)
    # update piece attributes to new_x and new_y positions
    if !is_obstructed?(new_x, new_y)
      if landing_square_available?(new_x, new_y)
        self.update_attributes(x_position: new_x, y_position: new_y)

      elsif !landing_square_available?(new_x, new_y) && Piece.where(x_position: new_x, y_position: new_y, game_id: self.game_id).first.color == self.color
              # Invalid move
              raise[:notice] = "invalid move"
      else
        Piece.where(x_position: new_x, y_position: new_y, game_id: self.game_id).first.update_attributes(x_position: nil, y_position: nil, game_id: self.game_id)
        self.update_attributes(x_position: new_x, y_position: new_y, 
                               captured: true)
        # Captures piece present
      end
    else
      if is_obstructed?(new_x, new_y) == true
        raise[:notice] = "invalid move"
      end 
      # Invalid move due to obstructed path
    end  
  end

  private
  
  #Horizontal movement only
  def horizontal_obstructed?(new_x) 
    Piece.where(x_position:(self.x_position - 1...new_x),
                y_position:self.y_position, game_id: self.game_id).present? && 
    Piece.where(x_position:(self.x_position + 1..new_x),
                y_position:self.y_position, game_id: self.game_id).present?
  end

  #Vertical movement only
  def vertical_obstructed?(new_y)  
    Piece.where(y_position:(self.y_position - 1...new_y), 
                x_position:self.x_position, game_id: self.game_id).present? &&
    Piece.where(y_position:(self.y_position + 1...new_y),
                x_position:self.x_position, game_id: self.game_id).present?
  end

  #Diagonal movement only
  def diagonal_obstructed?(new_x, new_y)  
    Piece.where(y_position:(self.y_position - 1...new_y),
                x_position:(self.x_position - 1...new_x), game_id: self.game_id)
                .present? &&
    Piece.where(y_position:(self.y_position + 1...new_y),
                x_position:(self.x_position + 1...new_x), game_id: self.game_id)
                .present?
  end

  #Invalid movement (movement not horizontal, vertical, or diagonal)
  def invalid_move?(new_x, new_y) 
    if x_position == new_x && y_position == new_y
      return true
    elsif new_x < 1 || new_x > 8 || new_y < 1 || new_y > 8
      return true
    else
      return false
    end
  end

  def name
    self.class.to_s
  end
  
  def landing_square_available?(new_x, new_y)
    @move_to = Piece.where(x_position: new_x, y_position: new_y, 
                          game_id: self.game_id).take
    if @move_to == nil
      return true
    elsif @move_to.color == self.color
      return false
    elsif @move_to.color != self.color
    # Landing square is not available because the piece currently present must be captured to move here!
      return false
    else
      return false
    end
  end
end
