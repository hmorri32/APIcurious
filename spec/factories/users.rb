FactoryBot.define do
  factory :user do
    username { Faker::Hipster.word }
    avatar_url "https://i.pinimg.com/736x/cb/bb/4b/cbbb4b991d4fe833bc2786e0df13d4c0--the-life-aquatic-shower-curtains.jpg"
    email "coolguy@whatever.com"
    uid "MyString"
    provider "github"
    oauth_token "1234"
  end
end