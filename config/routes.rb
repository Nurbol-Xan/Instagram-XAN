Rails.application.routes.draw do
  root 'posts#index'
  
  devise_for :accounts 
  
  
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # get '/accounts/:id', to: 'accounts/show'
  
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
