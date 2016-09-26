class AddCurrentPlayerToGame < ActiveRecord::Migration
  def change
    add_reference :games, :current_player, references: :users, index: true
    add_foreign_key :games, :users, column: :current_player_id
  end
end
