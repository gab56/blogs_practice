# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  resources :posts do
    resources :comments
    resources :rankings
  end

  resources :categories

  get "users/index", to: "users#index"

  root to: "posts#index"
end
