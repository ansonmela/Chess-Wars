class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :game_name
      t.string :state
      t.integer :white_player_id
      t.integer :black_player_id
      t.integer :winning_player_id
      t.timestamp :start_time
      t.timestamp :end_time
      t.integer :user_turn
      t.time :game_time_limit

      t.timestamps
    end
  end
end
