require "require_all"
require "sinatra"

set :bind, '0.0.0.0'

get "/" do
    erb :mentee_form
end
    
# Database
require_relative "db/db"

# App
require_all "models"
require_all "controllers"
require_all "helpers"

