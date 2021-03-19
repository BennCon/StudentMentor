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

# Methods for acceptance testing

def register_log_in_mentee
    visit "/index"
    click_button "mentee-signup"
    fill_in "First name", with: "MenteeFirst"
    fill_in "surname", with: "Surname"
    fill_in "course", with: "COM1001"
    select 'Male', from: "gender"
    select '1st', from: "year_of_study"
    fill_in "email", with: "menteetest@test.com"
    fill_in "password", with: "Testpass"
    click_button "mentee_submit"
    visit "/index"
    fill_in "email", with: "menteetest@test.com"
    fill_in "password", with: "Testpass"
    click_button "signin"
end

def register_log_in_mentor
    visit "/index"
    click_button "mentor-signup"
    fill_in "First name", with: "MentorFirst"
    fill_in "surname", with: "Surname"
    select 'Male', from: "gender"
    select 'Aerospace', from: "industry"
    fill_in "company", with: "Testcompany"
    choose 'yes'
    select "Accounting", from: "degree_field"
    fill_in "email", with: "mentortest@test.com"
    fill_in "password", with: "Testpass"
    click_button "mentor_submit"
    visit "/index"
    fill_in "email", with: "mentortest@test.com"
    fill_in "password", with: "Testpass"
    click_button "signin"
end