class Api::V1::GitHubController < ApplicationController
  def user
    json_response({
      username:   current_user.username,
      avatar_url: current_user.avatar_url
    })
  end

  def followers
    json_response(current_user.followers)
  end

  def following
    json_response(current_user.following)
  end

  def starred_repos
    json_response(current_user.starred_repos)
  end

  def user_repos
    json_response(current_user.user_repos)
  end

  def user_organizations
    json_response(current_user.user_organizations)
  end

  def received_events
    render json: current_user.received_events
  end

  def user_events
    # render json: GitHubService.new(current_user).user_events
    render json: current_user.user_events
  end
end