class CreatePieces < ActiveRecord::Migration[5.0]
  def change
    create_table :pieces do |t|
      t.integer :x_position
      t.integer :y_position
      t.string :symbol
      t.string :color
      t.integer :game_id
      t.integer :player_id
      t.datetime :created_at
      t.datetime :updated_at
      t.string :type
      t.string :state
      t.boolean :captured
      t.timestamps
    end
  end
end
