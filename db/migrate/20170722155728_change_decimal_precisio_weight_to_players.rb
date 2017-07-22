class ChangeDecimalPrecisioWeightToPlayers < ActiveRecord::Migration
  def change
    change_column :players, :weight, :decimal, :precision => 5, :scale => 2
  end
end
