source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.1"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.2", ">= 7.0.2.3"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.6"

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Use Tailwind CSS [https://github.com/rails/tailwindcss-rails]
gem "tailwindcss-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Redis adapter to run Action Cable in production
gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Sass to process CSS
# gem "sassc-rails"

# Friendly ID is used to configure which model attribute is used in the URL slug.
gem "friendly_id"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]

  # RSpec is used as the application testing framework (and an alternative to the default Minitest).
  gem "rspec-rails"
  # Capybara is used to write integration/feature tests.
  gem "capybara"
  # Selenium Webdriver is used to simulate how a real user interacts with the web browser during testing.
  gem "selenium-webdriver"
  # Factory Bot is used as the application testing fixture/factory.
  gem "factory_bot_rails"
  # Faker is used to generate pseudorandom data.
  gem "faker"
  # Shoulda Matchers adds many common one-line RSpec test matchers.
  gem "shoulda-matchers"

  # Rubocop is used to enforce coding style through static analysis.
  gem "rubocop", require: false
  # Rubocop Rails adds Rail's specific checks to Rubocop.
  gem "rubocop-rails", require: false
  # Rubocop RSpec adds RSpec specific checks to Rubocop.
  gem "rubocop-rspec", require: false
  # Rubocop Rake adds Rake specific checks to Rubocop.
  gem "rubocop-rake", require: false
  # Rubocop Performance adds performance specific checks to Rubocop.
  gem "rubocop-performance", require: false

  # Brakeman is a static analysis tool used to detect security vulnerabilities.
  gem "brakeman"
end

group :development do
  # Use Foreman to run both Tailwind compiler and Rails server in development
  gem "foreman"
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"

  # Annotate automatically adds a comment with the database schema to the top of relevant files.
  gem "annotate"
end
