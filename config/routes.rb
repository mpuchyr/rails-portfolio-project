Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#index'
  
  resources :sessions, except: [:destroy]
  get '/auth/facebook/callback' => 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users
end
