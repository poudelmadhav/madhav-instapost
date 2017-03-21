Rails.application.routes.draw do
  devise_for :users

  resources :users, only: :show

  resources :posts do
	  resources :comments
	end

  root 'posts#index'  
end
