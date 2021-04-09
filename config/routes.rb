Rails.application.routes.draw do
  root to: 'purchases#index'

  namespace :api do
    namespace :v1 do
      resources :purchases, only: [:create, :index]
    end
  end
end
