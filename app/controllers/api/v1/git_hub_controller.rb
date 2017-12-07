class Api::V1::GitHubController < ApplicationController
  def user
    render json: current_user
  end

  def follower_count
    render json: GitHubService.new(current_user).follower_count
  end
end