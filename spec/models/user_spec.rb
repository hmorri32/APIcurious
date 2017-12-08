require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { create(:user) }

  describe "user logs in" do
    describe "with valid credentials" do
      it "returns a valid user" do
        expect(user).to be_a User
      end

      it "has a provider" do
        expect(user.provider).to eq('github')
      end

      it 'has a username' do
        expect(user.username.class).to eq(String)
      end

      it 'has an avatar image' do
        expect(user.avatar_url).to eq('https://i.pinimg.com/736x/cb/bb/4b/cbbb4b991d4fe833bc2786e0df13d4c0--the-life-aquatic-shower-curtains.jpg')
      end

      it 'has an email address' do
        expect(user.email).to eq('coolguy@whatever.com')
      end

      it 'has a UID' do
        expect(user.uid).to eq('MyString')
      end

      it 'has an oath_token' do
        expect(user.oauth_token).to eq(ENV["GITHUB_TOKEN"])
      end
    end
  end

  describe "class methods" do
    describe '#followers' do
      it "returns a user's follower count" do
        VCR.use_cassette("user/followers") do
          expect(user.followers.count).to eq(2)
        end
      end
    end
  end
end
