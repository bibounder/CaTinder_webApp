Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  namespace :api do
    resources :users, only: [:show, :create, :update] do
      collection do
        get :authenticate
      end
    end

    resources :cats, only: [:index, :show]

    resources :races, only: [:index]
  end

  scope module: 'front' do
    get 'login' => 'sessions#new'
    post 'login' => 'sessions#create'

    root to: 'cat_likes#index'
  end
end
