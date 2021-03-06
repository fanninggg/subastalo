Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users, controllers: { registrations: 'registrations' }

  get "/about", to: "pages#about"
  get "/contact", to: "pages#contact"
  get "/favorites", to: "pages#favorites"
  get "/history", to: "pages#history"
  get "/terms", to: "pages#terms"
  get "/privacy", to: "pages#privacy"
  resources :products, only: [:show] do
    member do
      post "/favorite", to: "products#favorite"
      post "/unfavorite", to: "products#unfavorite"
    end
  end
  resources :categories, only: [:show, :index]
  resources :bids, only: [:new, :create]
  resources :contacts, only: [:create]
  resources :documents, only: [:destroy]

  # Admin Routes
  authenticate :user, ->(user) { user.admin? } do
    namespace :admin do
      resources :products, only: [:show, :new, :create, :edit, :update, :destroy] do
        member do
          patch '/hide', to: 'products#hide'
        end
      end
      resources :features, only: [:destroy]
      resources :users, only: [:index, :show, :update, :destroy] do
        member do
          get 'documents', to: 'users#documents'
        end
        resources :strikes, only: [:new, :create]
      end
      resources :categories, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
        member do
          patch '/hide', to: 'categories#hide'
        end
      end
    end
  end
end
