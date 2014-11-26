Rails.application.routes.draw do
  
  root 'pages#home'
  
  resources :users
  
  resources :photos
  
  resources :posts
  
  # session requests
  get 'sessions/new', to: 'sessions#new', as: 'sign_in'
  post 'sessions/create', to: 'sessions#create'
  delete 'sessions/destroy', to: 'sessions#destroy', as: 'sign_out'
  
  

end
