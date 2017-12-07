class Api::V1::GitHubController < ApplicationController
  def user
    render json: { username: current_user.username, avatar_url: current_user.avatar_url }
  end

  def follower_count
    render json: GitHubService.new(current_user).follower_count
  end
end