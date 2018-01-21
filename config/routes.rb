Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/contact", to: 'pages#contact'
  get "/about", to: 'pages#about'
  get "/emergency", to: 'pages#emergency'
  get "/emergency/A", to: 'pages#emergency_A'
  get "/emergency/B", to: 'pages#emergency_B'
  # get "/gallery", to: 'photos#index'

  # resources :users, only: [:show]
  get '/dashboard', to: 'users#dashboard'


  resources :events, only: [:index, :destroy, :show, :edit, :update, :new, :create] do
    resources :saved_events, only: [:create]
  end


  resources :resources, only: [:index, :destroy, :show, :edit,  :new, :update, :create] do
    resources :saved_resources, only: [:create]
  end
  resources :saved_events, only: [:destroy]
  resources :saved_resources, only: [:destroy]

  resources :photos, only: [:index, :create, :destroy]
  get "/gallery", to: 'photos#index'

end


