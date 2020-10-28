Rails.application.routes.draw do
  resources :sessions, only: [:new, :create]

  get 'login', to: 'sessions#new', as: 'login'

  root to: 'home#index'
end
