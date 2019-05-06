Rails.application.routes.draw do
  devise_for :users

  get 'posts/index', to: 'posts#index'
  get 'posts/:id/show', to: 'posts#show'

  get 'users/index', to: 'users#index'
  get 'users:id/show', to: 'users#show'

end
