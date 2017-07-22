class AddCupsToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :cups, :integer, :null => false, :default => 0
  end
end
