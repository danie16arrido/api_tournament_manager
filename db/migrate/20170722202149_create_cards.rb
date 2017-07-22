class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.references :player, index: true, foreign_key: true
      t.references :match, index: true, foreign_key: true
      t.integer :minute
      t.string :colour

      t.timestamps null: false
    end
  end
end
