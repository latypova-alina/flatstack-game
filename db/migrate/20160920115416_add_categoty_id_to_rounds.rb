class AddCategotyIdToRounds < ActiveRecord::Migration
  def change
    add_reference :rounds, :category, index: true, foreign_key: true
  end
end
