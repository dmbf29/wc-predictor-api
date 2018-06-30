Rails.application.routes.draw do
  require 'sidekiq/web'
  # authenticate :user, lambda { |u| u.admin } do
  mount Sidekiq::Web => '/sidekiq'
  # end

  post 'user_token' => 'user_token#create'

  namespace :api do
    namespace :v1 do
      resources :teams, only: [:index]
      resources :matches, only: [:index, :show]
      resources :groups, only: [:index]
      resources :predictions, only: [:index, :create, :update]
      resources :leagues, only: [:index, :create] do
        get '/groups/:id', to: 'league_groups#show'
      end
      resources :memberships, only: [:create]
      get 'knockouts', to: 'knockouts#index'
      get 'knockouts/:id', to: 'knockouts#show'
      get 'group_names', to: 'groups#names'
      post 'predictions/:id', to: 'predictions#update'
      post 'users', to: 'users#create'
      get 'user', to: 'users#show'
      get 'users', to: 'users#index'
      post 'user', to: 'users#update'
      post 'user_token' => 'user_token#create'
    end
  end
end
