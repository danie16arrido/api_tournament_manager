class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :last_name
      t.references :team, index: true, foreign_key: true
      t.integer :age
      t.decimal :height, precision: 3, scale: 2
      t.decimal :weight, precision: 3, scale: 2

      t.timestamps null: false
    end
  end
end
