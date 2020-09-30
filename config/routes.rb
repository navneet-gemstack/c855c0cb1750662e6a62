Rails.application.routes.draw do
	namespace :api do  	
		resources :user
		get '/users', to: 'user#users', as: 'users'
		get '/typeahead/:input', to: 'user#typeahead', as: 'typeahead'
	end
end
