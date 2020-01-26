Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:show, :edit, :update, :index]
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  root to:"home#top"
  get "home/about" => "home#about"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
