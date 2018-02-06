class Game < ApplicationRecord
  scope :available, -> { where("white_player_id IS NULL OR black_player_id IS NULL")}
  has_many :pieces
  has_many :users

  def self.create_game
    game = Game.create

    8.times do |pawn|
      Pawn.create(x_position: pawn+1, y_position: 2, color: "white", game_id: game.id)
    end

    8.times do |pawn|
      Pawn.create(x_position: pawn+1, y_position: 7, color: "black", game_id: game.id)
    end

    Queen.create(x_position: 4, y_position: 1, game_id: game.id, color: "white")
    Queen.create(x_position: 4, y_position: 8, game_id: game.id, color: "black")

    King.create(x_position: 5, y_position: 1, game_id: game.id, color: "white")
    King.create(x_position: 5, y_position: 8, game_id: game.id, color: "black")

    Bishop.create(x_position: 3, y_position: 1, game_id: game.id, color: "white")
    Bishop.create(x_position: 6, y_position: 1, game_id: game.id, color: "white")
    Bishop.create(x_position: 3, y_position: 8, game_id: game.id, color: "black")
    Bishop.create(x_position: 6, y_position: 8, game_id: game.id, color: "black")

    Knight.create(x_position: 2, y_position: 1, game_id: game.id, color: "white")
    Knight.create(x_position: 7, y_position: 1, game_id: game.id, color: "white")
    Knight.create(x_position: 2, y_position: 8, game_id: game.id, color: "black")
    Knight.create(x_position: 7, y_position: 8, game_id: game.id, color: "black")

    Rook.create(x_position: 1, y_position: 1, game_id: game.id, color: "white")
    Rook.create(x_position: 8, y_position: 1, game_id: game.id, color: "white")
    Rook.create(x_position: 1, y_position: 8, game_id: game.id, color: "black")
    Rook.create(x_position: 8, y_position: 8, game_id: game.id, color: "black")

    game
  end

end
