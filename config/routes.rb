Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root 'posts#index'

  get "/new", to: "posts#new"
  get "/all", to: "posts#all"
  
  devise_for :accounts 

  resources :accounts, only: [:index,:show] do 
    resources :follows, only: [:create, :destroy], shallow: true
    resources :followings, only: [:create, :destroy], shallow: true
  end

  resources :posts, only: [:index, :show, :create, :destroy] do
    resources :photos, only: [:create]
    resources :likes, only: [:create, :destroy], shallow: true
    resources :comments, only: [:index, :create, :destroy], shallow: true
    resources :saveds, only: [:create, :destroy], shallow: true
  end
end
