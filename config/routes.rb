Rails.application.routes.draw do
  # TIPS
  # ** remove routes that you're not using **

 #root 'sessions#home'
# get '/signup', to: 'astrophotographers#new'
 #post '/signup', to: 'astrophotographers#create'
 #get '/login', to: 'sessions#new'
 #post '/login', to: 'sessions#create'
 #get '/about', to: 'session#show', as: :home
# delete '/logout', to: 'sessions#destroy'
  #get '/stargazings', to: 'stargazings#new'
 
  #resources :astrophotographers, :constellations, :stargazings
 
  ##update -
  #get '/constellations', to: 'constellations#index'
 
  #resources :constellations, only: %i[index show] 
  resources :constellations
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
#get '/astrophotographers', to: 'astrophotographers#index'

end
