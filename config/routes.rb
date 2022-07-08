Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :users, only: [:edit, :update] 
  resources :items
  resources :orders, only: [:index, :create]

  resources :orders do
    resources :
end
  