Rails.application.routes.draw do
  root to: 'sessions#home'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/about', to: 'session#show'
  # get 'exit', to: 'sessions#destroy', as: :logout
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'astrophotographers#new'
  post '/signup', to: 'astrophotographers#create'
 
  resources :astrophotographers, :constellations, :stargazings, :sessions
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
#get '/astrophotographers', to: 'astrophotographers#index'

end
