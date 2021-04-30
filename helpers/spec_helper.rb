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
end

# Clear the database so it is ready for testing
clear_db

# Methods for acceptance testing

def register_mentee(first, sur, username, gender, email)
    visit "/mentee-form"
    fill_in "first_name", with: first
    fill_in "surname", with: sur
    fill_in "username", with: username
    fill_in "course", with: "COM1001"
    select gender, from: "gender"
    select '1st', from: "year_of_study"
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