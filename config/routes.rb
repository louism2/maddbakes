Rails.application.routes.draw do
  
  resources :comments, only: [:create, :destroy]

  root 'pages#home'
  
  resources :users
  
  resources :photos
  
  resources :posts
  
  resources :sessions, only: [:new, :create, :destroy]
  get 'sessions/new', to: 'sessions#new', as: 'sign_in'  
  
  # session requests
  # get 'sessions/new', to: 'sessions#new', as: 'sign_in'
  # post 'sessions', to: 'sessions#create'
  # delete 'sessions', to: 'sessions#destroy', as: 'sign_out'
  
  

end
