Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]

  get 'login', to: 'sessions#new', as: 'login'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  root to: 'home#index'
end
