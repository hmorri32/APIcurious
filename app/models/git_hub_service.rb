class GitHubService
  def initialize(user)
    @user   = user
    @client = configure_faraday
  end

  def configure_faraday
    Faraday.new(url: "https://api.github.com") do |f|
      f.headers["Accept"] = "application/vnd.github.cloak-preview"
      f.adapter Faraday.default_adapter
    end
  end

  def follower_count
    get_json("/users/#{user.username}")[:followers]
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