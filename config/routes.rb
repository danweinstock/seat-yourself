Rails.application.routes.draw do

  get 'sessions/new'

	resources :users
	resources :restaurants
	resources :reservations   

end
