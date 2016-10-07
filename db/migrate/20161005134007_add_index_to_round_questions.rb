class AddIndexToRoundQuestions < ActiveRecord::Migration
  def change
    add_column :round_questions, :index, :integer
  end
end
