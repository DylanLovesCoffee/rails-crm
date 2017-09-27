Rails.application.routes.draw do
  resources :users, except: [:index] do
    resources :clients do
      resources :contacts, except: [:index, :show]
      resources :comments, only: [:new, :create]
    end
  end

  root to: 'sessions#index'
  get 'login', to: 'sessions#login', as: :login
  post 'authenticate', to: 'sessions#authenticate', as: :authenticate
  get 'logout', to: 'sessions#logout', as: :logout
end
