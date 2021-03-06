Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#index'
  
  resources :sessions, except: [:new, :destroy]
  get '/auth/facebook/callback' => 'sessions#create'
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'

  resources :users, except: [:new, :edit] do
    resources :photoshoots
  end

  resources :photoshoots


  get '/signup', to: 'users#new'





end
