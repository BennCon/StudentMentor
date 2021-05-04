require_relative "../../helpers/spec_helper"

RSpec.describe "Get Help" do
    describe "GET /get-help-mentee" do
        
        before(:all) do
            create_mentee_model
            post "/", "username" => "user", "password" => "test1234"
        end
        
        after(:all) do
            clear_db
        end
        
        it "has a status code of 200 (OK)" do
            get "/get-help-mentee"
            expect(last_response.status).to eq(200)
        end
        
        it "includes a frequently asked question section" do
            get "/get-help-mentee"
            expect(last_response.body).to include('FAQ')
        end
    end
end