class AddFirstPlayerAnswerIdAndSecondPlayerAnswerIdToRoundQuestions < ActiveRecord::Migration
  def change
    add_column :round_questions, :first_player_answer_id, :integer
    add_column :round_questions, :second_player_answer_id, :integer
    add_foreign_key :round_questions, :answers, column: :first_player_answer_id
    add_foreign_key :round_questions, :answers, column: :second_player_answer_id
  end
end
