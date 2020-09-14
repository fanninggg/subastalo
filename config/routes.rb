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
  resources :bids, only: [:new, :create]
  resources :contacts, only: [:create]

  # Admin Routes
  authenticate :user, ->(user) { user.admin? } do
    namespace :admin do
      resources :products, only: [:new, :create, :edit, :update, :destroy] do
        member do
          patch '/hide', to: 'products#hide'
        end
      end
      resources :users, only: [:index, :show, :update, :destroy] do
        resources :strikes, only: [:new, :create]
      end
      resources :categories, only: [:index, :show, :edit, :update, :destroy]
    end
  end
end
