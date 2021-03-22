#ENV["APP_ENV"] = "test"

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

# Display LOC test coverage
require "simplecov"
SimpleCov.start do
    add_filter "/spec/"
end
SimpleCov.coverage_dir "coverage"

# Clears the entire testing database 
def clear_db
    DB.from("mentees").delete
    DB.from("mentors").delete
    DB.from("admins").delete
    DB.from("users").delete
end

# Remove comment from below when there is more than one database
#clear_db

# Methods for acceptance testing

def register_log_in_mentee
    visit "/mentee-form"
    fill_in "first_name", with: "MenteeFirst"
    fill_in "surname", with: "Surname"
    fill_in "course", with: "COM1001"
    select 'Male', from: "gender"
    select '1st', from: "year_of_study"
    fill_in "email", with: "menteetest@test.com"
    fill_in "password", with: "Testpass"
    click_button "mentee_submit"
    log_in "menteetest@test.com"
end

def register_mentor(first, sur, gender, industry, degree, email)
    visit "/mentor-form"
    fill_in "first_name", with: first
    fill_in "surname", with: sur
    select gender, from: "gender"
    select industry, from: "industry"
    fill_in "company", with: "Testcompany"
    choose "yes"
    select degree, from: "degree_field"
    fill_in "email", with: email
    fill_in "password", with: "Testpass"
    click_button "mentor_submit"
end

def log_in(email)
    visit "/"
    fill_in "email", with: email
    fill_in "password", with: "Testpass"
    click_button "signin"
end