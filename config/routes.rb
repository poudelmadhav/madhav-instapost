Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users

  resources :users, only: :show

  get "timeline" => "static_pages#timeline"
  get 'user/timeline', to: 'users#timeline' # for timeline.json

  resources :follows, only: [:create, :destroy] 

  resources :notifications do
    collection do
      post :mark_as_read
    end
  end

  resources :posts do
  	resources :post_comments
  	resources :upvotes, only: :create
  	resources :downvotes, only: :create
  end

  root 'posts#index' 
end
