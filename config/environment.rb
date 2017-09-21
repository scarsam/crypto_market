# First load bundler
require 'bundler'
# Require the Gems from the Gemfile using bundler
Bundler.require

# Load libraries
require_all './lib'

# Check if environment is loading
puts "Environment is loaded!"