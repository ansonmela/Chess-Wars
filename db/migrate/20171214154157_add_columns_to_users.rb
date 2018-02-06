class AddColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :user_name, :string
    add_column :users, :rating, :integer
  end
end
