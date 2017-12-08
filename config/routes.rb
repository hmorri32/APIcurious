Rails.application.routes.draw do
  root "home#index"

  get '/auth/github',          as: :login
  get '/auth/github/callback', to: 'sessions#create'
  get 'dashboard',             to: 'users#show'
  delete '/logout',            to: 'sessions#destroy'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get 'followers', to: "git_hub#followers"
      get 'user',      to: "git_hub#user"
    end
  end
end