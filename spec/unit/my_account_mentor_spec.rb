require_relative "../../helpers/spec_helper"

RSpec.describe "My Account Mentor" do
    describe "GET /my-account-mentor" do
        
        before(:all) do
            create_mentor_model
            post "/", "username" => "user", "password" => "test1234"
        end
        
        after(:all) do
            clear_db
        end
        
        it "has a status code of 200 (OK)" do
            get "/my-account-mentor"
            expect(last_response.status).to eq(200)
        end
        
        it "Has profile information" do
            get "/my-account-mentor"
            expect(last_response.body).to include('<section id="information">', '<section id="profile">')
        end
    end
end