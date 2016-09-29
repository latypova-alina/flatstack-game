class AddWinnerIdToGames < ActiveRecord::Migration
  def change
    add_column :games, :winner_id, :integer
    add_foreign_key :games, :users, column: :winner_id
  end
end
