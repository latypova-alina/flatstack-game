class CreateRoundQuestions < ActiveRecord::Migration
  def change
    create_table :round_questions do |t|
      t.belongs_to :round, index: true
      t.belongs_to :question, index: true

      t.timestamps null: false
    end
  end
end
