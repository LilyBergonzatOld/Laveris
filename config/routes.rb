Rails.application.routes.draw do
  resources :users

  resources :events

  resources :laundromats

  root to: 'users#index', via: :get
  get 'auth/facebook', as: "auth_provider"
  get 'auth/facebook/callback', to: 'users#login'
  get 'logout', to: 'users#logout', as: :logout
end
