Rails.application.routes.draw do
  root "home#index"

  get '/auth/github',          as: :login
  get '/auth/github/callback', to: 'sessions#create'
  get 'dashboard',             to: 'users#show'
  delete '/logout',            to: 'sessions#destroy'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get '/user',               to: "git_hub#user"
      get '/followers',          to: "git_hub#followers"
      get '/following',          to: "git_hub#following"
      get '/starred_repos',      to: "git_hub#starred_repos"
      get '/user_repos',         to: "git_hub#user_repos"
      get '/user_organizations', to: "git_hub#user_organizations"
      get '/received_events',    to: "git_hub#received_events"
      get '/user_events',        to: "git_hub#user_events"
    end
  end
end