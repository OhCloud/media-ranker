Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'works#index'
  
  resources :works
  resources :homepages
  # resources :votes
  resources :users
  
  get '/login', to: 'users#login_form', as:'login'
  post '/login', to: 'users#login'
  post '/logout', to: 'users#logout', as: 'logout'
  get "/users/current", to: "users#current", as: "current_user" 
  post '/vote/:id', to: 'votes#vote', as: 'vote'
end
