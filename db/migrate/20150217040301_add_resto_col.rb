class AddRestoCol < ActiveRecord::Migration
  def change
  	add_column :restaurants, :picture, :string
  	add_column :restaurants, :menu, :string
  	add_column :restaurants, :address, :string
  	add_column :restaurants, :phone_number, :string
  end
end


