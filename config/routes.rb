Rails.application.routes.draw do
  devise_for :users

  resources :users, only: :show

  resources :posts do
	resources :comments
	resources :upvotes, only: :create
	resources :downvotes, only: :create
  end

  root 'posts#index'  
end
