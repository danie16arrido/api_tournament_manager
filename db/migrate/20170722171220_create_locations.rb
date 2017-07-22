class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.references :league, index: true, foreign_key: true
      t.float :lat
      t.float :lng

      t.timestamps null: false
    end
  end
end
