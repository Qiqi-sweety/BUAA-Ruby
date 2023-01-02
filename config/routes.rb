Rails.application.routes.draw do
  resources :order_items
  resources :carts
  resources :deliveries
  resources :comments
  resources :orders
  resources :riders
  resources :buyers
  resources :items
  resources :sellers
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "welcome#index"
end
