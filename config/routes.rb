Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:update, :show]

  authenticated do
    root to: 'users#show', as: :authenticated
  end

  root to: 'home#index'

  resources :lists do
    resources :tasks, only: [:create, :destroy, :edit, :update]
  end

  get "/profile" => "users#show", as: :profile

end
