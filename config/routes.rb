Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show]
  resource :friendships, only: [:create, :destroy, :update]
  root 'home#index'
end
