class ChangeAttribToPlayers < ActiveRecord::Migration
  def change
    change_table :players do |t|
      t.string :name
      t.string :last_name
      t.references :team, index: true, foreign_key: true
      t.integer :age
      t.decimal :height, precision: 4, scale: 2
      t.decimal :weight, precision: 4, scale: 2

      t.timestamps null: false
    end
  end
end
