Rails.application.routes.draw do

root 'sessions#home'

get '/login', to: 'sessions#new'
post '/login', to: 'sessions#create'
delete '/logout', to: 'sessions#destroy'

get '/auth/:provider/callback', to: 'sessions#omniauth'

get '/signup', to: 'astrophotographers#new'
post '/signup', to: 'astrophotographers#create'
  
get '/astrophotographers/:id', to: 'astrophotographers#show'
patch '/astrophotographers/:id', to: 'astrophotographers#update'

  resources :astrophotographers
  #resources :sighting, only: [:index]
  
  resources :stargazings
  
    resources :constellations do
        resources :stargazings
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

