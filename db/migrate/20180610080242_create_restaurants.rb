class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name, null: false
      t.string :address
      t.string :station
      t.string :phone
      t.float :score
      t.references :area, index: true, foreign_key: true
      t.timestamps
    end
  end
end
