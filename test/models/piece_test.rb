require "test_helper"

describe Piece do
  
  setup do
    @game = Game.create_game
    @pawn1 = Piece.where(game_id: @game.id, x_position: 1, y_position: 2).first
  end
  # let(:game) {Game.create_game}

  # let(:piece) { Piece.create(id: 1, game_id: game.id, x_position: 1, y_position: 2, 
  #               symbol: "pawn", color: "black", player_id: 1, created_at: 
  #               "1/1/2016", updated_at: "1/1/2016", type: Piece, state: true, 
  #               captured: false ) }
  
  it "must not be an obstructed move" do
    assert_equal false, @pawn1.is_obstructed?(1, 3)
  end

  it "must be a valid piece" do
    value(@game).must_be :valid?
  end
  
  it "must load all pieces at game creation" do
    assert_equal 32, Piece.where(game_id: @game.id).count
  end
  
  it 'must not allow a piece to move off the board vertically' do
    assert_equal true, @pawn1.is_obstructed?(3, 9)
  end
  
  it 'must not allow a piece to move off the board horizontally' do
    assert_equal true, @pawn1.is_obstructed?(0, 5)
  end
  
  it 'must allow a piece to land on an empty position' do
    assert_equal true, @pawn1.move_to!(1, 4)
  end
  
  it 'must allow for capture of piece of different color' do
    assert_equal true, @pawn1.move_to!(1, 6)
  end
  
  it 'must move piece to new location if empty' do
    @pawn1.move_to!(1, 4)
    assert_equal 1, @pawn1.x_position
    assert_equal 4, @pawn1.y_position
    
  end
  
  it 'must not move to a square with a piece of the same color' do
    r = Piece.where(x_position: 1, y_position: 1, game_id: @game.id).first
    r.move_to!(2, 1)
    assert_equal 1, r.x_position
    assert_equal 1, r.y_position
    
  end
  
  it 'must capture piece of opposite color when moving into new location' do
    r = Piece.where(x_position: 1, y_position: 1, game_id: @game.id).first
    @pawn1.update_attributes(x_position: nil, y_position: nil, game_id: @game.id)
    r.move_to!(1, 7)
    assert_equal 1, r.x_position
    assert_equal 7, r.y_position
    assert_equal 2, Pawn.where(x_position: nil, y_position: nil, game_id: @game.id).length
    assert_equal 1, Piece.where(x_position: 1, y_position: 7, game_id: @game.id).length
    assert_equal 1, Piece.where(captured: true).length
  end
  
end
