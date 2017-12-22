Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/contact", to: 'pages#contact'
  get "/about", to: 'pages#about'

  resources :users, only: [:show]

  resources :events, only: [:index, :destroy, :show, :edit, :update, :new, :create]
  resources :resources, only: [:index, :destroy, :show, :edit,  :new, :update, :create]
end


