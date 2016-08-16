class AddForeignKeysToGame < ActiveRecord::Migration
  def change
    add_foreign_key :games, :users, column: :player_1
    add_foreign_key :games, :users, column: :player_2
  end
end
