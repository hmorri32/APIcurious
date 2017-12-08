class Api::V1::GitHubController < ApplicationController
  def user
    render json: { username: current_user.username, avatar_url: current_user.avatar_url }
  end

  def followers
    render json: GitHubService.new(current_user).followers
  end
end