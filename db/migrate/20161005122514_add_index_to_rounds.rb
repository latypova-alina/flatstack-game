class AddIndexToRounds < ActiveRecord::Migration
  def change
    add_column :rounds, :index, :integer
  end
end
