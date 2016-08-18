class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :player_1
      t.integer :player_2, null: true
      t.string :state, null: false

      t.timestamps null: false
    end
  end
end
