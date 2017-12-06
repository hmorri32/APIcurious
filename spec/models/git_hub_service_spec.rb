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
        VCR.use_cassette("GitHubService/follower_count", :record => :new_episodes) do
          expect(github.follower_count).to eq(2)
        end
      end
    end
  end
end
