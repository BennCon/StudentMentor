require_relative "../../helpers/spec_helper"

RSpec.describe "All Mentees" do
    describe "GET /all-mentees" do
        
        before(:all) do
            create_mentor_model
            post "/", "username" => "user", "password" => "test1234"
        end
        
        after(:all) do
            clear_db
        end
        
        it "has a status code of 200 (OK)" do
            get "/all-mentees"
            expect(last_response.status).to eq(200)
        end
        
        it "displays a list of all the mentees" do
            get "/all-mentees"
            expect(last_response.body).to include('<table id="users-table">').or include('<p>The database is empty!</p>')
        end
    end
end