Rails.application.routes.draw do
  resources :cities, only: [:index, :show, :new, :create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :destroy]

  get 'login', to: 'sessions#new', as: 'login'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  root to: 'home#index'
end
