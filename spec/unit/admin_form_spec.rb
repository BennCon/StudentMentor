require "rspec"
require "rack/test"

require_relative "../../controllers/admin_form"
require_relative "../../helpers/spec_helper"

RSpec.describe "Admin Form" do
    include Rack::Test::Methods
    
    def app
        Sinatra::Application
    end
    
    describe "GET /admin-form" do
        it "has a status code of 200 (OK)" do
            get "/admin-form"
            expect(last_response.status).to be_ok
        end
        
        it "includes a form" do
            get "/admin-form"
            expect(last_response.body).to include('<form method="post">')
        end
    end
end