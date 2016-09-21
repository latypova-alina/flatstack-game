class AddCurrentRoundToGame < ActiveRecord::Migration
  def change
    add_reference :games, :current_round, references: :rounds, index: true
    add_foreign_key :games, :rounds, column: :current_round_id
  end
end
