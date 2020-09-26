Rails.application.routes.draw do
  resources :astrophotographers
  resources :constellations
  resources :stargazings
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
#resource :new
get '/astrophotographers', to: 'astrophotographers#index'
end
