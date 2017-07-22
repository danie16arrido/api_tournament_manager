class ChangeDecimalPrecisioToPlayers < ActiveRecord::Migration
  def change
    change_column :players, :height, :decimal, :precision => 5, :scale => 2
  end
end
