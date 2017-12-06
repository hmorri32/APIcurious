class GitHubService
  def initialize(user)
    @user   = user
    @client = configure_faraday
  end

  def configure_faraday
    Faraday.new(url: "https://api.github.com") do |f|
      f.headers["Accept"] = "application/vnd.github.cloak-preview"
      f.adapter Faraday.default_adapter
      # f.token_auth(user.oauth_token)
      # f.authorization :token, user.oauth_token
      # conn.request :oauth2, 'token'
    end
  end

  def follower_count
    get_json("/users/#{user.username}")[:followers]
  end

  def following_count
    get_json("/users/#{user.username}")[:following]
  end

  def find_starred_repos
    get_json("/users/#{@user.username}/starred")
  end

  private
    attr_reader :client, :user

    def gh_params
      { client_id: ENV["GITHUB_CLIENT_ID"], client_secret: ENV["GITHUB_CLIENT_SECRET"] }
    end

    def get_json(url)
      response = client.get(url, gh_params)
      JSON.parse(response.body, symbolize_names: true)
    end
end