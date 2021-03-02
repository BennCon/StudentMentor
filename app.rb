require "require_all"
require "sinatra"

set :bind, '0.0.0.0'

require_all "controllers"