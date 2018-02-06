require 'test_helper'

describe Knight do
    
  let (:knight) {Knight.create(x_position: 3, y_position: 1, color: 'white')}
  let (:knight2) {Knight.create(x_position: 6, y_position: 1, color: 'white')}
  let (:knight3) {Knight.create(x_position: 3, y_position: 8, color: 'black')}
  let (:knight4) {Knight.create(x_position: 4, y_position: 4, color: 'black')}

  it 'must load both Knight pieces when a game is created' do
    game = Game.create_game
    assert_equal 4, Knight.where(game_id: game.id).length
  end

  it 'must include white pieces' do
    value(knight.color).must_equal 'white'
  end

  it 'must include black pieces' do
    value(knight4.color).must_equal 'black'
  end

  it 'must allow 1st movement' do
    assert_equal true, knight4.valid_move?(5, 6)
  end

  it 'must not allow 12oclock movement' do
    assert_equal false, knight4.valid_move?(4, 6)
  end

  it 'must allow 7th movement' do
    assert_equal true, knight4.valid_move?(2, 5)
  end

  it 'must not allow 9oclock movement' do
    assert_equal false, knight4.valid_move?(2, 4)
  end
end