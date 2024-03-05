require "capybara/rails"

RSpec.configure do |config|
  config.include Capybara::RSpecMatchers, type: :component
end
