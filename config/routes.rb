Rails.application.routes.draw do

  get 'sessions/new'

	resources :users
	resources :restaurants
	resources :reservations 

	resources :sessions
	
	get 'login' => 'sessions#new', as: :login

end
