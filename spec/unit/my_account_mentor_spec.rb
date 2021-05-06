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
    
    describe "POST /my-account-mentor" do
        before(:all) do
            create_mentor_model
            post "/", "username" => "user", "password" => "test1234"
        end
        
        after(:all) do
            clear_db
        end
        
        it "redirects to the same page on a success" do
            post "/my-account-mentor", "first_name" => "X", "username"=> "user123", "surname"=> "Y", "email"=> "testtest123@test.test", "industry" => "Engineering", "company" => "products INC", "biography" => "i love playing cricket"
            expect(last_response.status).to eq(302)
            expect(last_response.location).to eq("http://example.org/my-account-mentor")
        end
        
        it "changes the account as expected" do
            post "/my-account-mentor", "first_name" => "X", "username"=> "user123", "surname"=> "Y", "email"=> "testtest123@test.test", "industry" => "Engineering", "company" => "products INC", "biography" => "i love playing cricket"
            expect(Mentor[1].first_name).to eq("X")
            expect(Mentor[1].username).to eq("user123")
            expect(Mentor[1].surname).to eq("Y")
            expect(Mentor[1].email).to eq("testtest123@test.test")
            expect(Mentor[1].industry).to eq("Engineering")
            expect(Mentor[1].biography).to eq("i love playing cricket")
            expect(Mentor[1].company).to eq("products INC")
        end
    end
end