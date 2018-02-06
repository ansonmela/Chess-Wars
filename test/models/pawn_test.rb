require 'test_helper'

describe Pawn do
  let (:pawn) {Pawn.create(x_position: 1, y_position: 2, color: "white", game_id: 2)}
  let (:pawn2) {Pawn.create(x_position: 1, y_position: 7, color: "black", game_id: 2)}
  let (:pawn3)  {Pawn.create(x_position: 1, y_position: 3, color: "white", game_id: 2)}
  let (:pawn4) {Pawn.create(x_position: 2, y_position: 3, color: "black", game_id: 2)}
  
  it "must load all pawns when a game is created" do
    game = Game.create_game
    assert_equal 16, Pawn.where(game_id: game.id).count
  end
  
  it "must include white pieces" do
    assert_equal "white", pawn.color
  end
  
  it "must include black pieces" do
    assert_equal "black", pawn2.color
  end

  it "must not allow horizontal movements" do
    assert_equal false, pawn.pawn_valid_move?(2, 2)
  end

  it "must allow vertical movement one space" do
    assert_equal true, pawn.pawn_valid_move?(1, 3) 
  end

  it "must not allow backwards movements for black" do
    assert_equal false, pawn2.pawn_valid_move?(1, 8) 
  end

  it "must not allow backwards movements for white" do 
    assert_equal false, pawn.pawn_valid_move?(1, 1)
  end

  it "must allow 2 space movement on first turn" do
    assert_equal true, pawn.pawn_valid_move?(1, 4)
  end

  it "must capture a piece with diagonal movement" do 
    assert_equal true, pawn.pawn_valid_move?(2, 3)
  end
end