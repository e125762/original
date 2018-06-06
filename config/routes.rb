Rails.application.routes.draw do

  get 'groups_users/create'
  get 'groups_users/destroy'
  root to: 'toppages#index'
  resources :users, only: [:new, :create] do
    member do
      get :groups_users
    end
  end
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :groups
  resources :groups_users, only: [:create, :destroy]
end
