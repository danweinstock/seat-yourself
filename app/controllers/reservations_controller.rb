class ReservationsController < ApplicationController
  before_filter :ensure_logged_in, except: [:show]
  before_filter :load_restaurant, except: [:new, :create]

  def index 
  	@reservations = Reservation.all 
  end

  def new
    # @restaurant
    # binding.pry
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = Reservation.new 
  end 
  
  def show
    @reservation.newest_first = Reservation.find(params[:id])
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    @reservation.restaurant = @restaurant
   
    if @reservation.save
      redirect_to @restaurant, notice: "Your reseveration has been successfully created"
    else
      flash.now[:alert] = "Error saving reservation"
      render 'restaurants/show'  
    end  
  end
  # @reservation.save ? redirect_to(restaurants_path, notice: "Your reservation was successfully created!") : render("restaurants/show")
  

  def edit
    @reservation = Reservation.find(params[:id])
  end

  # def update
  #   @reservation = Reservation.find(params[:id])
  #   @reservation.update(reservation_params) ? redirect_to({ controller: "restaurants", action: "show" , id: @restaurant.id }, notice: "Your reseveration has been successfully updated ") : render(:edit)          
  # end

  # def update 
  #   @reservation = Reservation.find(params[:id])
  #   if @reservation.update_attributes(reservation_params)
  #     redirect_to reservations_url
  #   else
  #     render :edit
  #   end 
  # end 

  # def destroy
  #   @reservation = Reservation.find(params[:id])
  #   reservations.destroy
  # end

  private   

  def reservation_params
    params.require(:reservation).permit(:restaurant_id, :party_size, :time, :date, :user_id)
  end

  def load_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end