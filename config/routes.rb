Rails.application.routes.draw do

  root 'posts#index'
  root 'products#index'

resources :posts do
  member do
  put "like", to: "posts#upvote"
end
resources :comments
end





   get '/comments', to: 'comments#create'
   get '/comments/:id', to: 'comments#show'
  post '/comments', to: 'comments#create'

  get '/categories', to: 'categories#new'
  get '/categories/:id', to: 'categories#show'


devise_for :users

resources :products  do
  resources :comments, :categories, :products
 end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

