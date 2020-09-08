Rails.application.routes.draw do
	get 'homes/top'
	get 'homes/about'
	devise_for :users
	resources :users do
		resource :relationships, only: [:create, :destroy]
		get 'follows' => 'relationships#follower', as: 'follows'
		get 'followers' => 'relationships#followed', as: 'followers'
	end
	resources :relationships
	resources :blogs
	root "homes#top"
end
