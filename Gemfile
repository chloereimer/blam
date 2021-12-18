source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.1"

gem "rails", "~> 6.1.3", ">= 6.1.3.2"

gem "pg", "~> 1.1" # Use postgresql as the database for Active Record

gem "puma", "~> 5.5" # Use Puma as the app server

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw] # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "standard", "~> 1.1" # Standard for linting/formatting
  gem "rspec-rails", "~> 5.0.0" # Rspec for tests
  gem "factory_bot_rails", "~>6.2" # factory bot for factories
end

group :development do
  gem "listen", "~> 3.3"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby] # Windows does not include zoneinfo files, so bundle the tzinfo-data gem
