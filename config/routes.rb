Rails.application.routes.draw do
  get '/signup', to: 'astrophotographers#new'
  get '/login', to:, 'sessions#new'
  resources :astrophotographers
  resources :constellations
  resources :stargazings
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
#get '/astrophotographers', to: 'astrophotographers#index'
end
