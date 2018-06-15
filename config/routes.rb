Rails.application.routes.draw do

  root to: 'toppages#index'
  resources :users, only: [:new, :create] do
    member do
      get :groups_users
    end
  end
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :groups do
    resource :comments, only: [:create]
    resources :restaurants, only: [:index]
    resource :likes, only: [:create, :destroy]
  end

  get "/groups/:group_id/comments" => redirect("/groups/%{group_id}")
  get "/users" => redirect("/signup")
  resources :groups_users, only: [:create, :destroy]
end
