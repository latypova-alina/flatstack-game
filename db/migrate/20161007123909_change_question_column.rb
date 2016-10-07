class ChangeQuestionColumn < ActiveRecord::Migration
  def change
    rename_column :questions, :question, :question_text

  end
end
