require_relative "../../helpers/spec_helper"

RSpec.describe "My Account Admin" do
    describe "GET /my-account-admin" do
        
        before(:all) do
            create_admin_model
            post "/", "username" => "user", "password" => "test1234"
        end
        
        after(:all) do
            clear_db
        end
        
        it "has a status code of 200 (OK)" do
            get "/my-account-admin"
            expect(last_response.status).to eq(200)
        end
        
        it "Has profile information" do
            get "/my-account-admin"
            expect(last_response.body).to include('A', 'B')
        end
    end
    
    describe "POST /my-account-admin" do
        before(:all) do
            create_admin_model
            post "/", "username" => "user", "password" => "test1234"
        end
        
        after(:all) do
            clear_db
        end
        
        it "redirects to the same page on a success" do
            post "/my-account-admin", "first_name" => "X", "username"=> "user123", "surname"=> "Y", "email"=> "testtest123@test.test"
            expect(last_response.status).to eq(302)
            expect(last_response.location).to eq("http://example.org/my-account-admin")
        end
        
        it "changes the account as expected" do
            post "/my-account-admin", "first_name" => "X", "username"=> "user123", "surname"=> "Y", "email"=> "testtest123@test.test"
            expect(Admin[1].first_name).to eq("X")
            expect(Admin[1].username).to eq("user123")
            expect(Admin[1].surname).to eq("Y")
            expect(Admin[1].email).to eq("testtest123@test.test")
        end
    end
end