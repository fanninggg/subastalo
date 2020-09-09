Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users

  get "/about", to: "pages#about"
  get "/contact", to: "pages#contact"
  resources :products, only: [:show]
  resources :categories, only: [:show, :index]

  # Admin Routes
  namespace :admin do
    resources :products, only: [:new, :create, :edit, :update, :destroy]
    resources :users, only: [:index, :show, :edit, :update, :destroy]
    resources :categories, only: [:index, :show, :edit, :update, :destroy]
  end
end
