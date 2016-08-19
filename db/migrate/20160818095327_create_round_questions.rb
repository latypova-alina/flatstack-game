class CreateRoundQuestions < ActiveRecord::Migration
  def change
    create_table :round_questions do |t|
      t.integer :question_id
      t.integer :round_id
      
      t.timestamps null: false
    end
  end
end
