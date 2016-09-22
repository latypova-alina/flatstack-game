class CreatePlayerAnswers < ActiveRecord::Migration
  def change
    create_table :player_answers do |t|
      t.references :user, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true
      t.references :answer_variant, index: true, foreign_key: true
      t.boolean :truthy
    end
  end
end
