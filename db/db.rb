require "logger"
require "sequel"

#Allows switching test -> production db
type = ENV.fetch("APP_ENV", "production_db")

#Finds the path to the database file
db_path = File.dirname(__FILE__)
db = "#{db_path}/#{type}.sqlite3"


#Finds the path to the log
log_path = "#{File.dirname(__FILE__)}/../log/"
log = "#{log_path}/#{type}.log"

#Creates the log directory if it does not exist
Dir.mkdir(log_path) unless File.exist?(log_path)

#Sets up the Sequel database instance
DB = Sequel.sqlite(db, logger: Logger.new(log))


