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
  resources :posts
end
