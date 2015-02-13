class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :party_size
      t.datetime :date
      t.integer :time

      t.timestamps null: false
    end
    add_foreign_key :reservations, :restaurants
    add_foreign_key :reservations, :users
  end
end
