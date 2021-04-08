Rails.application.routes.draw do
  root to: 'purchases#index'

  resources :purchases, only: [:create, :index]
end
