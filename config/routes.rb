Rails.application.routes.draw do
  root to: 'api/v1/purchases#index'

  namespace :api do
    namespace :v1 do
      resources :purchases, only: [:create, :index]
    end
  end
end
