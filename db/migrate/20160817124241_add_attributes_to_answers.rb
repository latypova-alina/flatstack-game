class AddAttributesToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :question_id, :integer
    add_column :answers, :truthy, :boolean
  end
end
