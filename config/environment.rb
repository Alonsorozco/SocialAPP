# Load the Rails application.
require_relative "application"

config.assets.compile = false
config.assets.digest = true
config.assets.precompile += %w( application.js application.css )


# Initialize the Rails application.
Rails.application.initialize!

