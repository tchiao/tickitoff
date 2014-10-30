Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:update, :show]
  root to: 'home#index'

  resources :lists do
    resources :tasks, only: [:create, :destroy, :edit, :update]
    # member "/list", to: :show
  end

  get "/list" => "lists#show", as: :single_list

end
