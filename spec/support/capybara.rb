require 'capybara/rails'
require 'capybara/rspec'

Capybara.server = :puma
Capybara.default_driver = :selenium_headless
