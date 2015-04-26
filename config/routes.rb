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

    resources :cat_likes, only: [:create]
    get 'cat_likes' => 'cat_likes#create'
  end

  scope module: 'front' do
    get 'login' => 'sessions#new'
    post 'login' => 'sessions#create'

    #root to: 'cat_likes#index'
    root to: 'misc#index'
    get 'clear_likes' => 'misc#clear_likes'
  end
end
