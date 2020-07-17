Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :tweets do
    resources :comments, only: :create
  end
  resources :users
  resources :messages, only: :create
  resources :rooms, only: [:create, :show, :index]
  resources :notifications, only: :index
end
