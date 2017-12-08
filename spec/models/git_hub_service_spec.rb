require 'rails_helper'

RSpec.describe GitHubService do
  let!(:user) { create(:user) }
  let!(:github) { GitHubService.new(user) }

  describe "initialize" do
    it 'returns an instance' do
      expect(github).to be_a GitHubService
    end
  end

  describe "class methods" do
    describe "#followers" do
      it 'returns a users follower count' do
        VCR.use_cassette("git_hub_service/followers", :match_requests_on => [:method]) do
          expect(github.followers.count).to eq(2)
        end
      end
    end

    describe "#following" do
      it "returns the number of following" do
        VCR.use_cassette("git_hub_service/following", :match_requests_on => [:method]) do
          expect(github.following.count).to eq(0)
        end
      end
    end

    describe "#starred_repos" do
      it "returns the starred repos" do
        VCR.use_cassette("git_hub_service/starred_repos", :match_requests_on => [:method]) do
          expect(github.starred_repos.count).to eq(15)
        end
      end
    end

    describe "#user_repos" do
      it 'returns a users repos' do
        VCR.use_cassette('git_hub_service/user_repos', :match_requests_on => [:method]) do
          expect(github.user_repos.length).to eq(91)
        end
      end
    end

    describe "#user_organizations" do
      it "returns a users organizations" do
        VCR.use_cassette('git_hub_service/user_organization', :match_requests_on => [:method]) do
          expect(github.user_organizations.length).to eq(0)
        end
      end
    end

    describe "#received_events" do
      it "returns a users events" do
        VCR.use_cassette('git_hub_service/received_events', :match_requests_on => [:method]) do
          expect(github.received_events.length).to eq(2)
        end
      end
    end

    describe "#user_events" do
      it "returns a users events" do
        VCR.use_cassette('git_hub_service/user_events', :match_requests_on => [:method]) do
          expect(github.user_events.length).to eq(30)
        end
      end
    end
  end
end