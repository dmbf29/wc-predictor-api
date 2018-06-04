Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'

  namespace :api do
    namespace :v1 do
      resources :teams
      resources :matches
      resources :groups
      resources :predictions
      resources :leagues
      resources :memberships
      post 'predictions/:id', to: 'predictions#update'
      post 'users', to: 'users#create'
      get 'user', to: 'users#show'
      post 'user', to: 'users#update'
      post 'user_token' => 'user_token#create'
    end
  end
end
