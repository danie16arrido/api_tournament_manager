class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.references :home
      t.references :away
      t.date :date
      t.time :time
      t.references :league, index: true, foreign_key: true
      t.references :location, index: true, foreign_key: true
      t.references :referee, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
