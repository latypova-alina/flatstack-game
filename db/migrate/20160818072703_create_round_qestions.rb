class CreateRoundQestions < ActiveRecord::Migration
  def change
    create_table :round_qestions do |t|
      t.integer :round_id
      t.integer :question_id
      
      t.timestamps null: false
    end
  end
end
