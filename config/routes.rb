Rails.application.routes.draw do
  root 'sessions#home'
  get '/signup', to: 'astrophotographers#new'
  post '/signup', to: 'astrophotographers#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :astrophotographers
  resources :constellations
  # get '/constellations', to: 'constellations#index'
  # get '/constellations/:id', to: 'constellations#show'
  # get '/constellations/new', to: 'constellations#new'
  resources :stargazings
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
#get '/astrophotographers', to: 'astrophotographers#index'

end
