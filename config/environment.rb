# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
return if defined?(Rails::Server)

