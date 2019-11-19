require_relative '../kickstarter_scraper'

# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.drb          = true
  config.drb_port     = 1234
  config.default_path = 'behavior'
end