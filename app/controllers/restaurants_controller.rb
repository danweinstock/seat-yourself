class RestaurantsController < ApplicationController

	def index
		@restaurants = Restaurant.all
	end

	def show
		@restaurant = Restaurant.find[pa(:id)]
	end

	def new
		@restaurant = Restaurant.new
	end

	def create
		@restaurant = Restaurant.create(restaurant_params)

		if @restaurant.save
			redirect_to restaurants_url
		else
			render :new 
		end
	end

	private

	def restaurant_params
		params.require(:restaurant).permit(:name, :address, :phone_number, :picture, :description, :cuisine, :capacity, :neighbourhood)
	end
	
end
