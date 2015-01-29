Rails.application.routes.draw do
  resources :users

  resources :events

  resources :laundromats

  root to: 'users#index', via: :get
  get 'auth/facebook', as: 'auth_provider'
  get 'auth/facebook/callback', to: 'users#callback'
  get 'logout', to: 'users#logout', as: :logout
  get 'profile', to: 'users#profile', as: :profile
  get 'parameters', to: 'users#parameters', as: :parameters
end
