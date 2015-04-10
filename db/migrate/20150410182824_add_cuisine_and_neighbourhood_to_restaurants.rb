class AddCuisineAndNeighbourhoodToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :cuisine, :string
    add_column :restaurants, :neighbourhood, :string
  end
end
