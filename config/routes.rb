Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'


  resources :users, only: [:show, :edit, :update]

  resources :events, only: [:index, :destroy, :show, :new, :create]
  resources :resources, only: [:index, :destroy, :show, :new, :create]
end


