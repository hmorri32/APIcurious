source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails',           '~> 5.1.4'
gem 'pg',              '~> 0.18'
gem 'puma',            '~> 3.7'
gem 'sass-rails',      '~> 5.0'
gem 'uglifier',        '>= 1.3.0'
gem 'coffee-rails',    '~> 4.2'
gem 'turbolinks',      '~> 5'
gem 'jbuilder',        '~> 2.5'
gem 'omniauth-github'
gem 'faraday'
gem 'figaro'
gem 'database_cleaner'
gem 'webpacker'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'launchy'
  gem 'factory_bot_rails'
  gem 'shoulda-matchers'
  gem 'faker'
end

group :test do
  gem 'vcr'
  gem 'webmock'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
