class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.integer :capacity
      t.integer :open
      t.integer :closed
      t.string :cuisine
      t.string :neighbourhood

      t.timestamps null: false
    end
  end
end
