require_relative "../../helpers/spec_helper"

RSpec.describe "Requests Page" do
    describe "GET /requests-mentor" do
        
        before(:all) do
            create_mentor_model
            post "/", "username" => "user", "password" => "test1234"
        end
        
        after(:all) do
            clear_db
        end
        
        it "has a status code of 200 (OK)" do
            get "/requests-mentor"
            expect(last_response.status).to eq(200)
        end
        
        it "Displays requests" do
            get "/requests-mentor"
            expect(last_response.body).to include('requests')
        end
    end
end