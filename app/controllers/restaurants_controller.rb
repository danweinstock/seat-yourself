class RestaurantsController < ApplicationController
	#before_filter :ensure_logged_in, only: [:create, :edit, :destroy]
	  before_filter :create_reservation
	def index
		@restaurants = Restaurant.all
	end

	def new
		@restaurant = Restaurant.new
	end

	def create
		@restaurant = Restaurant.new(restaurant_params)

		if @restaurant.save
			redirect_to restaurant_path(@restaurant), notice: "The following restaurant was successfully created"
		else
			flash.now[:alert] = "There was a mistake while creating the restaurant"
			render :new
		end 
	end

	def edit
		@restaurant = Restaurant.find(params[:id])
	end 

	def destroy
		@restaurant = Restaurant.find(params[:id])
		@restaurant.destroy
		redirect_to restaurants_url
	end 

	private

	def restaurant_params
		params.require(:restaurant).permit(:name, :address, :phone_number, :picture, :description, :cuisine, :capacity, :neighbourhood)
	end
	
	def create_reservation
		@reservation = Reservation.new
	end
end
