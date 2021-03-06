require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'support/factory_bot.rb'
require 'vcr'
require 'support/spec_helper_methods.rb'
require 'database_cleaner'
require 'webmock/rspec'
require 'webmock'

ActiveRecord::Migration.maintain_test_schema!

DatabaseCleaner.strategy = :truncation

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

VCR.configure do |config|
  config.cassette_library_dir = "spec/vcr/"
  config.hook_into :webmock
  config.filter_sensitive_data('<SUH_DUDE>') { ENV["GITHUB_CLIENT_ID"]  }
  config.filter_sensitive_data('<SUH_DUDE>') { ENV["GITHUB_CLIENT_SECRET"]  }
  config.default_cassette_options = {:record => :new_episodes}
end

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.include SpecHelperMethods

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
