Rails.application.routes.draw do
  resources :users, except: [:index]

  get 'login', to: 'sessions#login', as: :login
  post 'authenticate', to: 'sessions#authenticate', as: :authenticate
  get 'logout', to: 'sessions#logout', as: :logout
end
