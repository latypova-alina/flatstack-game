class ChangeAnswerColumn < ActiveRecord::Migration
  def change
    rename_column :answer_variants, :answer, :answer_text
  end
end
