require "rspec"
require "rack/test"

require_relative "../../controllers/mentee_form"
require_relative "../../helpers/spec_helper"


RSpec.describe "Mentee Form" do
    include Rack::Test::Methods
    
    def app
        Sinatra::Application
    end
    
    describe "GET /mentee-form" do
        it "has a status code of 200 (OK)" do
            get "/mentee-form"
            expect(last_response.status).to be_ok
        end
        
        it "includes a form" do
            get "/mentee-form"
            expect(last_response.body).to include('<form method="post">')
        end
    end
end