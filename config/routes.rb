Rails.application.routes.draw do
  resources :users, except: [:index]

  get 'login', to: 'sessions#login', as: :login
end
