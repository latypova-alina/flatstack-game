class AddGameIdToPlayerAnswers < ActiveRecord::Migration
  def change
    add_reference :player_answers, :game, index: true, foreign_key: true
  end
end
