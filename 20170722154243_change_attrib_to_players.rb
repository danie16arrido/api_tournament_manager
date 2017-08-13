class ChangeAttribToPlayers < ActiveRecord::Migration
  def change
    change_table :players do |t|
      t.decimal :height, precision: 4, scale: 2
      t.decimal :weight, precision: 4, scale: 2
    end
  end
end
