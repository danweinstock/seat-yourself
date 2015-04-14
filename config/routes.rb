Rails.application.routes.draw do

 root 'sessions#index'
  get 'sessions/new'
	
	get '/reservations/' => 'reservations#index'

	resources :users

	resources :restaurants do
		resources :reservations, only: [:new, :destroy, :index]
	end

	resources :reservations
		
	resources :sessions
	
	get 'login' => 'sessions#new', as: :login
  get 'logout' => 'sessions#destroy', as: :logout
  get 'signup' => 'users#new', :as => :signup  
end
