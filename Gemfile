source "https://rubygems.org"

ruby "3.3.0"

# Drivers
gem "pg", "~> 1.1"
gem "redis", ">= 4.0.1"

# Framework
gem "bootsnap", require: false
gem "rails", "~> 7.1.3", ">= 7.1.3.2"

# Security
gem "authentication-zero"
gem "bcrypt", "~> 3.1.7"
gem "pwned"

# Assets/View Extensions
gem "importmap-rails"
gem "phlex-rails"
gem "propshaft"
gem "stimulus-rails"
gem "tailwindcss-rails"
gem "turbo-rails"

# Application Server
gem "puma", ">= 5.0"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[windows jruby]

group :development, :test do
  gem "debug", platforms: %i[mri windows]
  gem "factory_bot_rails"
  gem "faker"
  gem "irb"
  gem "rspec-rails"
  gem "rubocop-rake"
  gem "rubocop-rspec"
  gem "rubocop-thread_safety"
  gem "standard"
  gem "standard-rails"
end

group :development do
  gem "annotate"
  gem "database_consistency", require: false
  gem "hotwire-livereload"
  gem "letter_opener"
  gem "prettier_print"
  gem "ruby-lsp-rails"
  gem "ruby-lsp-rspec"
  gem "spring"
  gem "spring-commands-rspec"
  gem "spring-commands-standard", github: "fdietz/spring-commands-standard"
  gem "spring-watcher-listen"
end

group :test do
  gem "capybara"
  gem "database_cleaner-active_record"
  gem "selenium-webdriver"
  gem "shoulda-matchers"
end
