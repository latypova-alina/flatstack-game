class AddCurrentRoundIdToGames < ActiveRecord::Migration
  def change
    add_reference :games, :round, index: true, foreign_key: true
  end
end
