class GitHubService
  def initialize(user)
    @user   = user
    @client = configure_faraday
  end

  def configure_faraday
    Faraday.new(url: "https://api.github.com") do |f|
      f.headers["Accept"]       = "application/vnd.github.cloak-preview"
      # f.params["client_id"]     = ENV["GITHUB_CLIENT_ID"]
      # f.params["client_secret"] = ENV["GITHUB_CLIENT_SECRET"]
      f.adapter Faraday.default_adapter
      f.params[:access_token]  = user.oauth_token

    end
  end

  def followers
    get_json('/user/followers')
  end

  def following
    get_json('/user/following')
  end

  def find_starred_repos
    get_json("/user/starred")
  end

  def user_repos
    get_json('/user/repos?page=1&per_page=100')
  end

  def user_organizations
    get_json('/user/orgs')
  end

  def user_received_events
    get_json("/users/#{user.username}/received_events?page=1&per_page=100")
  end

  def user_events
    get_json("/users/#{user.username}/events?page=1&per_page=100")
  end

  private
    attr_reader :client, :user

    def gh_params
      { client_id: ENV["GITHUB_CLIENT_ID"], client_secret: ENV["GITHUB_CLIENT_SECRET"] }
    end

    def get_json(url)
      response = client.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end
end