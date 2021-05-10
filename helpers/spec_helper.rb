ENV["APP_ENV"] = "test_db"

# Display LOC test coverage
require "simplecov"
SimpleCov.start do
    add_filter "/spec/"
end
SimpleCov.coverage_dir "coverage"

# load the app
require_relative "../app"

# Configure Capybara
require "capybara/rspec"
Capybara.app = Sinatra::Application

# Configure RSpec
require "rack/test"
require "rspec"
def app
  Sinatra::Application
end
RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include Capybara::DSL
end

# Clears the entire testing database 
def clear_db
    DB.from("mentees").delete
    DB.from("mentors").delete
    DB.from("admins").delete
    DB.from("users").delete
    DB.from("codes").delete
    DB.from("requests").delete
    DB.from("questions_answers").delete
end

# Clear the database so it is ready for testing
clear_db

# Methods for acceptance testing

def register_mentee(first, sur, username, gender, yos, email)
    visit "/mentee-form"
    fill_in "first_name", with: first
    fill_in "surname", with: sur
    fill_in "username", with: username
    fill_in "course", with: "COM1001"
    select gender, from: "gender"
    select yos, from: "year_of_study"
    fill_in "email", with: email
    fill_in "password", with: "Testpass"
    click_button "mentee_submit"
    log_in "Mentee1"
end

def register_mentor(first, sur, username, gender, industry, degree, email)
    visit "/mentor-form"
    fill_in "first_name", with: first
    fill_in "surname", with: sur
    fill_in "username", with: username
    select gender, from: "gender"
    select industry, from: "industry"
    fill_in "company", with: "Testcompany"
    choose "yes"
    select degree, from: "degree_field"
    fill_in "email", with: email
    fill_in "password", with: "Testpass"
    click_button "mentor_submit"
end

def register_admin(username, code, email)
    visit "/admin-form"
    fill_in "first_name", with: "AdminFirst"
    fill_in "surname", with: "Surname"
    fill_in "username", with: username
    fill_in "admin_code", with: code
    fill_in "email", with: email
    fill_in "password", with: "Testpass"
    click_button "admin_submit"
end

def log_in(username)
    visit "/"
    fill_in "username", with: username
    fill_in "password", with: "Testpass"
    click_button "signin"
end

def create_admin_model
    user = User.new(password: "test1234", user_type: "admin", username: "user")
    user.save_changes(:validate => false)
    admin = Admin.new(username: "user", first_name: "A", surname: "B", admin_code: "1234", email: "testtest@test.test", password: "test1234")
    admin.save_changes(:validate => false)
end

def create_mentor_model
    User.unrestrict_primary_key
    Mentor.unrestrict_primary_key
    user = User.new(first_name: "A", surname: "B", password: "test1234", user_type: "mentor", username: "user")
    user.save_changes(:validate => false)
    mentor = Mentor.new(first_name: "A", username: "user", surname: "B", industry: "ABCDEF", company:"ABCDE", email: "testtest@test.test", password: "test1234", sheffield_graduate: true, degree_field: "ABCD")
    mentor.save_changes(:validate => false)
end

def create_mentee_model
    User.unrestrict_primary_key
    Mentee.unrestrict_primary_key
    user = User.new(username: "user", password: "test1234", user_type: "mentee")
    user.save_changes(:validate => false)
    mentee = Mentee.new(username: "user", first_name: "A", surname: "B", course: "ABCD", year_of_study: 9999, email: "testtest@test.test", password: "test1234")
    mentee.save_changes(:validate => false)
end