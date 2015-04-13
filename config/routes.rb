Rails.application.routes.draw do

 root 'sessions#index'
  get 'sessions/new'

	resources :users

	resources :restaurants do
		resources :reservations, only: [:new, :destroy, :index]
	end

	resources :reservations
		
	
		


	resources :sessions
	
	get 'login' => 'sessions#new', as: :login

	 get '/reservations/' => 'reservations#index'

end
