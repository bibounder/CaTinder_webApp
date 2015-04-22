Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  namespace :api do
    resources :users, only: [:show, :create, :update] do
      collection do
        get :authenticate
      end
    end
  end
end
