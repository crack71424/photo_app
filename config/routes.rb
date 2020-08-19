Rails.application.routes.draw do
  root 'posts#index'
  get 'sessions/new'
  get '/signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :toppages
  resources :users
  resources :posts do
    resources :comments, only: [:index, :create, :show]
  end
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
end
