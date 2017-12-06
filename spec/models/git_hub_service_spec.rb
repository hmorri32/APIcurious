require 'rails_helper'

RSpec.describe GitHubService do
  let!(:user)   { create(:user) }
  let!(:github) { GitHubService.new(user) }

  describe "initialize" do
    it 'returns an instance' do
      expect(github).to be_a GitHubService
    end
  end

  describe "class methods" do
    describe "#follower_count" do
      it 'returns a users follower count' do
        VCR.use_cassette("GitHubService/follower_count", :match_requests_on => [:method]) do
          expect(github.follower_count).to eq(2)
        end
      end
    end

    describe "#following_count" do
      it "returns the number of following" do
        VCR.use_cassette("GitHubService/following_count", :match_requests_on => [:method]) do
          expect(github.following_count).to eq(0)
        end
      end
    end

    describe "#find_starred_repos" do
      it "returns the starred repos" do
        VCR.use_cassette("GitHubService/find_starred_repos", :match_requests_on => [:method]) do
          expect(github.find_starred_repos.count).to eq(15)
        end
      end
    end
  end
end
