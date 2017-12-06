module SpecHelperMethods
  def user
    create(:user)
  end

  def mock_login
    OmniAuth.config.test_mode = true

    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new ({
      'provider'    => user.provider,
      'uid'         => user.uid,
      'info'        => { email: user.email,  username: user.username, avatar_url: user.avatar_url },
      'credentials' => { token: user.oauth_token}
    })
  end
end