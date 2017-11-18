Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show]
  resources :locations, only: [:create, :new]
  resource :friendships, only: [:create, :destroy, :update]
  root 'home#index'
end
