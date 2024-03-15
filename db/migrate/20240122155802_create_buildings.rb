class CreateBuildings < ActiveRecord::Migration[7.0]
  def change
    create_table :buildings do |t|
      t.string :comment
      t.json :params
      t.references :building_level, foreign_key: true #, null: false
      t.references :settlement, foreign_key: true #, null: false

      t.timestamps
    end
  end
end
