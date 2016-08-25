class CorrectPlayerIdsFields < ActiveRecord::Migration
  def change
    rename_column :games, :player_1, :first_player_id
    rename_column :games, :player_2, :second_player_id
  end
end
