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
end