FactoryBot.define do
  factory :user do
    username 'hmorri32'
    avatar_url "https://i.pinimg.com/736x/cb/bb/4b/cbbb4b991d4fe833bc2786e0df13d4c0--the-life-aquatic-shower-curtains.jpg"
    email "coolguy@whatever.com"
    uid "MyString"
    provider "github"
    oauth_token ENV["GITHUB_TOKEN"]
  end
end