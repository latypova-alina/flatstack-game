class RenameAnswersToAnswerVariants < ActiveRecord::Migration
  def change
    rename_table :answers, :answer_variants
  end
end
