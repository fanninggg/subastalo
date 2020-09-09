Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users

  get "/about", to: "pages#about"
  get "/contact", to: "pages#contact"
  get "/favorites", to: "pages#favorites"
  resources :products, only: [:show] do
    member do
      post "/favorite", to: "products#favorite"
      post "/unfavorite", to: "products#unfavorite"
    end
  end
  resources :categories, only: [:show, :index]

  # Admin Routes
  namespace :admin do
    resources :products, only: [:new, :create, :edit, :update, :destroy]
    resources :users, only: [:index, :show, :edit, :update, :destroy]
    resources :categories, only: [:index, :show, :edit, :update, :destroy]
  end
end
