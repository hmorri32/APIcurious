module SpecHelperMethods
  def mock_login(user)
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new ({
      'provider'    => user.provider,
      'uid'         => user.uid,
      'info'        => {
        email:      user.email,
        username:   user.username,
        avatar_url: user.avatar_url
      },
      'credentials' => { token: ENV["GITHUB_TOKEN"] }
    })
  end

  def refresh_token(user)
    # user.refresh_token or whatever
    # only call this when you call real API call . ?
      # if user.token_expired? or something... figure it out
      # or if ENV[refreshtoken] boolean
        # user.refresh_token
        # file = FIle.open yml stuff
        # use yaml library to read contents
        # update file to include user.token
        # and then save token to file.
    # Use this in a before block maybe
    # or to_h on that yung yml, alter values, then back to_yml
  end
end