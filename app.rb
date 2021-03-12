require "require_all"
require "sinatra"

set :bind, '0.0.0.0'

# So we can escape HTML special characters in the view
include ERB::Util

# Database
require_relative "db/db"

# App
require_rel "models"
require_rel "controllers"
require_rel "helpers"

