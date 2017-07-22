class CreateReferees < ActiveRecord::Migration
  def change
    create_table :referees do |t|
      t.string :name
      t.string :last_name
      t.references :league, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
