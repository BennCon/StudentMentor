# Configure coverage logging
require "simplecov"
SimpleCov.start do
  add_filter "/spec/"
end
SimpleCov.coverage_dir "coverage"

#This is meant to make sure that when testing it uses the test db but it does NOT work
#ENV["APP_ENV"] = "test"

# load the app
require_relative "../app"

# Configure RSpec
require "rack/test"
require "rspec"
def app
  Sinatra::Application
end
RSpec.configure do |config|
  config.include Rack::Test::Methods
end

# Add Capybara
require "capybara"

# Methods for better acceptance testing

def register_mentee
    visit "/index"
    click_button "mentee-signup"
    fill_in "first_name", with: "First"
    fill_in "surname", with: "Surname"
    fill_in "course", with: "COM1001"
    select 'Male', from: "gender"
    select '1st', from: "year_of_study"
    fill_in "email", with: "test@test.com"
    fill_in "password", with: "Testpass"
    click_button "mentee_submit"
end

def register_mentor
    visit "/index"
    click_button "mentor-signup"
    fill_in "first_name", with: "First"
    fill_in "surname", with: "Surname"
    select 'Male', from: "gender"
    select 'Aerospace', from: "industry"
    fill_in "company", with: "Testcompany"
    choose 'yes'
    select "Accounting", from: "degree_field"
    fill_in "email", with: "test@test.com"
    fill_in "password", with: "Testpass"
    click_button "mentor_submit"
end