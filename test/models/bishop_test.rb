require 'test_helper'

describe Bishop do
    
  let (:bishop) {Bishop.create(x_position: 3, y_position: 1, color: "white")}
  let (:bishop2) {Bishop.create(x_position: 6, y_position: 1, color: "white")}
  let (:bishop3) {Bishop.create(x_position: 3, y_position: 8, color: "black")}
  let (:bishop4) {Bishop.create(x_position: 6, y_position: 8, color: "black")}

  it 'must load both bishop pieces when a game is created' do
    game = Game.create_game
    assert_equal 4, Bishop.where(game_id: game.id).length
  end
  
  it 'must include white pieces' do
    value(bishop.color).must_equal "white"
  end
  
  it 'must include black pieces' do
    value(bishop4.color).must_equal "black"
  end

  it 'must not allow horizontal movements' do
    assert_equal false, bishop.bishop_valid_move?(4, 1)
  end

  it 'must not allow vertical movements' do
    assert_equal false, bishop.bishop_valid_move?(3, 2)
  end

  it 'must allow diagonal movements' do
    assert_equal true, bishop4.bishop_valid_move?(3, 5)
  end
end