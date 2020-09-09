Rails.application.routes.draw do
  root to: 'categories#index'
  devise_for :users

  resources :products, only: [:show]
  resources :categories, only: [:show, :index]

  # Admin Routes
  namespace :admin do
    resources :products, only: [:new, :create, :edit, :update, :destroy]
    resources :users, only: [:index, :show, :edit, :update, :destroy]
    resources :categories, only: [:index, :show, :edit, :update, :destroy]
  end
end
