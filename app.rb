require "require_all"
require "sinatra"

set :bind, '0.0.0.0'

# So we can escape HTML special characters in the view
include ERB::Util

# Database
require_relative "db/db"

# App
# Why require_rel instead of require_all? require_rel is like require_relative_all
# in that require_all looks for files in the load path, meaning if tests are ran
# require_all starts looking for files in the test directories instead of relative to
# this file.
require_rel "models"
require_rel "controllers"
require_rel "helpers"

