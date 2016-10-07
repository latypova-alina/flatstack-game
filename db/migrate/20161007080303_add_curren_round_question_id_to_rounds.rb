class AddCurrenRoundQuestionIdToRounds < ActiveRecord::Migration
  def change
    add_reference :rounds, :current_round_question, references: :users, index: true
    add_foreign_key :rounds, :round_questions, column: :current_round_question_id
  end
end
