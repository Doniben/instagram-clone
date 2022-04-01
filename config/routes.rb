Rails.application.routes.draw do
  get 'pages/index'
  resources :comments
  resources :posts
  resources :likes
  resources :profiles
  resources :follows
  resources :pages, only: :index
  devise_for :users

  resources :users, path: '/', param: :username, only: [:show] do
    post :follow, to: 'profiles/follows#create', as: :follow
    delete :follow, to: 'profiles/follows#destroy', as: :unfollow
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "posts#index"
end
