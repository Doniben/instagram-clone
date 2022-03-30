Rails.application.routes.draw do
  resources :comments
  resources :posts
  resources :likes
  resources :profiles
  resources :follows
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "posts#index"
end
