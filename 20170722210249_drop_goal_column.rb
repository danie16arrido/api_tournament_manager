class DropGoalColumn < ActiveRecord::Migration
  def change
    remove_column :goals, :type
  end
end
