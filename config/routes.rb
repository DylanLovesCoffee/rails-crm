Rails.application.routes.draw do
  resources :users, except: [:index, :new]

  get 'signup', to: 'users#new', as: :signup

  get 'login', to: 'sessions#login', as: :login
end
