class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.references :player, index: true, foreign_key: true
      t.references :match, index: true, foreign_key: true
      t.integer :minute
      t.string :type

      t.timestamps null: false
    end
  end
end
