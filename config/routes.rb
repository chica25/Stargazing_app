Rails.application.routes.draw do
  # TIPS
  # ** remove routes that you're not using **

 #root 'sessions#home'
 #get '/home'
  get '/signup', to: 'astrophotographers#new'
  post '/signup', to: 'astrophotographers#create'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

get '/astrophotographers/:id', to: 'astrophotographers#show', as: :home

 #get '/about', to: 'session#show', as: :home


  resources :astrophotographers, except: [:index]
  #resources :sighting, only: [:index]

  get '/auth/:provider/callback', to: 'sessions#omniauth'
  
  resources :stargazings
  
    resources :constellations do
        resources :stargazings
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
#get '/astrophotographers', to: 'astrophotographers#index'

# -----  Example of nesting the Astrophotographer, constellations, stargazings
# resources  :astrophotographers do
  # get '/constellations' to:, 'constellations#index', as: 'constellations'
  # post '/constellations' to:, 'constellations#create'
  # get '/constellations/new', to: 'constellations#new, as: 'new_astrophotographer_constellation'
  # get '/constellations/:id', to: 'constellations#show, as: 'constellation_stargazing'
  # get '/constellations/:id/edit', to: 'constellations#edit', as: 'edit_astrophotographer_constellation'
#end

# resources :astrophotographer do
#   resources :constellations
# end

# resources :stargazings
#end
