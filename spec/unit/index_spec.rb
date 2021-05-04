require_relative "../../helpers/spec_helper"

RSpec.describe "Index" do
    describe "GET /" do
        it "has a status code of 200 (OK)" do
            post "/"
            expect(last_response.status).to eq(200)
        end
        
        it "includes a sign-in" do
            post "/"
            expect(last_response.body).to include('form method="post"')
        end
    end
    
    describe "Index Form Submission" do
        
        before(:all) do
            create_admin_model
        end
        
        after(:all) do
            clear_db
        end
        
        it "Redirects on a success" do
            post "/", "username" => "user", "password" => "test1234"
            expect(last_response).to be_redirect
            expect(last_response.location).to include('/my-account-admin')
        end
        
        it "Fails when there's no password" do
            post "/", "username" => "user"
            expect(last_response.body).to include('Username/Password combination incorrect')
        end
        
        it "Fails when there's no username" do
            post "/", "password" => "test1234"
            expect(last_response.body).to include('Username/Password combination incorrect')
        end
        
        it "Fails when there's no parameters" do
            post "/"
            expect(last_response.body).to include('Username/Password combination incorrect')
        end
        
        it "Fails when a false username is inputted" do
            post "/", "username" => "us3r", "password" => "test1234"
            expect(last_response.body).to include('Username/Password combination incorrect')
        end
    end
end