Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  resources :users, only: :show

  get "timeline" => "static_pages#timeline"
  get 'user/timeline', to: 'users#timeline' # for timeline.json

  resources :follows, only: [:create, :destroy] 

  resources :notifications

  resources :posts do
  	resources :comments
  	resources :upvotes, only: :create
  	resources :downvotes, only: :create
  end

  root 'posts#index' 
end
