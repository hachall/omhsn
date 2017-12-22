Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/contact", to: 'pages#contact'
  get "/about", to: 'pages#about'

  resources :users, only: [:show]

  resources :events, only: [:index, :destroy, :show, :edit, :update, :new, :create] do
    resources :saved_events, only: [:create]
  end

  resources :resources, only: [:index, :destroy, :show, :edit,  :new, :update, :create] do
    resources :saved_resources, only: [:create]
  end
  resources :saved_events, only: [:destroy]
  resources :saved_resources, only: [:destroy]
end


