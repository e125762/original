Rails.application.routes.draw do

  root to: 'toppages#index'
  resources :users, only: [:new, :create]
end
