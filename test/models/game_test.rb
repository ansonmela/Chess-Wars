require "test_helper"

describe Game do
  let(:game) { Game.new }
  let(:pieces) {Game.create_game}

  it "must be valid" do
    value(game).must_be :valid?
  end
  
  it "must load the pieces to the board" do
    game = Game.create_game
    assert_equal 32, Piece.where(game_id: game.id).length
  end
end

