IssueWall::Application.routes.draw do
  root 'issues#index'

  # resources :issues
  get '/wall' => 'issues#show'
  get '/callback' => 'issues#github_callback'
end
