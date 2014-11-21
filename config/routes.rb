Rails.application.routes.draw do
  
  root 'pages#home'
  
  resources :users
  
  resources :photos
  
  

end
