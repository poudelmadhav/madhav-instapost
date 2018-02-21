Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  resources :users, only: :show

  resources :follows, only: [:create, :destroy] 

  resources :posts do
	resources :comments
	resources :upvotes, only: :create
	resources :downvotes, only: :create
  end

  root 'posts#index'  
end
