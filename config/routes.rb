Rails.application.routes.draw do

  root to: 'toppages#index'
  resources :users, only: [:new, :create]
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
