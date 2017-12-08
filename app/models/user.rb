class User < ApplicationRecord
  def self.from_omniauth(auth)
    where(uid: auth.uid).first_or_initialize.tap do |user|
      user.email       = auth.info.email
      user.uid         = auth.uid
      user.provider    = auth.provider
      user.avatar_url  = auth.info.image
      user.username    = auth.info.name
      user.nickname    = auth.info.nickname
      user.oauth_token = auth.credentials.token
      user.save!
    end
  end

  def service
    GitHubService.new(self)
  end

  def followers
    service.followers
  end

  def following
    service.following
  end

  def starred_repos
    service.starred_repos
  end

  def user_repos
    service.user_repos
  end

  def user_organizations
    service.user_organizations
  end

  def received_events
    service.received_events
  end

  def user_events
    service.user_events
  end
end