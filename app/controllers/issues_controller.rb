class IssuesController < ApplicationController
  CONFIG = YAML.load_file('./config/config.yml')

  def github_credentials
    {
      client_id: CONFIG['github_credentials']['client_id'],
      client_secret: CONFIG['github_credentials']['client_secret']
    }
  end

  def index
    unless session[:oauth2_token]
      redirect_to IssueWallComponents::Github::Connection.new(github_credentials).authorize_url
    else
      redirect_to '/wall'
    end
  end

  def show
    gc = IssueWallComponents::Github::Connection.new(oauth_token: session[:oauth2_token])
    @issues = IssueWallComponents::Github::Issue.new(gc).all
  end

  def github_callback
    gc = IssueWallComponents::Github::Connection.new(github_credentials)
    session[:oauth2_token] = gc.github.get_token(params[:code]).token
    redirect_to '/'
  end
end
