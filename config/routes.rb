Rails.application.routes.draw do

# get 'stargazing/new'
root 'sessions#home'

get '/login', to: 'sessions#new'
post '/login', to: 'sessions#create'
delete '/logout', to: 'sessions#destroy'

get '/auth/:provider/callback', to: 'sessions#omniauth'

get '/signup', to: 'astrophotographers#new'
post '/signup', to: 'astrophotographers#create'
  

  resources :astrophotographers

  
  resources :stargazings
  
    resources :constellations, only: [:index, :show, :new, :create] do
      resources :stargazings
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

