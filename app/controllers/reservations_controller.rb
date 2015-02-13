class ReservationsController < ApplicationController
  before_filter :ensure_logged_in, only: [:new, :create, :destroy]
  # before_filter :load_restaurant

  def index 
  	@reservation = Reservation.all 
  end
  
  def show
    @reservation = Reservation.find(params[:id])
  end

  def create
    @reservation = @restaurants.reservation.build(reservation_params)
    @reservation.user = current_user
    @reservation.save ? redirect_to(restaurants_path, notice: "Your reservation was successfully created!") : render("restaurants/show")
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    @reservation.update(reservation_params) ? redirect_to({ controller: "restaurants", action: "show" , id: @restaurant.id }, notice: "Your reseveration has been successfully updated ") : render(:edit)          
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    reservations.destroy
  end

  private   

  def reservation_params
    params.require(:reservation).permit(:restaurant_id, :party_size, :time)
  end

  # def load_restaurant
  #   @Restaurant = Restaurant.find(params[:restaurant_id])
  # end
end