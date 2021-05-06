require_relative "../../helpers/spec_helper"

RSpec.describe "My Account Mentee" do
    describe "GET /my-account-mentee" do
        
        before(:all) do
            create_mentee_model
            post "/", "username" => "user", "password" => "test1234"
        end
        
        after(:all) do
            clear_db
        end
        
        it "has a status code of 200 (OK)" do
            get "/my-account-mentee"
            expect(last_response.status).to eq(200)
        end
        
        it "Has profile information" do
            get "/my-account-mentee"
            expect(last_response.body).to include('<section id="information">', '<section id="profile">')
        end
    end
    
    describe "POST /my-account-mentee" do
        before(:all) do
            create_mentee_model
            post "/", "username" => "user", "password" => "test1234"
        end
        
        after(:all) do
            clear_db
        end
        
        it "redirects to the same page on a success" do
            post "/my-account-mentee", "first_name" => "X", "username"=> "user123", "surname"=> "Y", "email"=> "testtest123@test.test", "year_of_study" => 1, "course" => "Maths", "biography" => "i love playing cricket"
            expect(last_response.status).to eq(302)
            expect(last_response.location).to eq("http://example.org/my-account-mentee")
        end
        
        it "changes the account as expected" do
            post "/my-account-mentee", "first_name" => "X", "username"=> "user123", "surname"=> "Y", "email"=> "testtest123@test.test", "year_of_study" => 1, "course" => "Maths", "biography" => "i love playing cricket"
            expect(Mentee[1].first_name).to eq("X")
            expect(Mentee[1].username).to eq("user123")
            expect(Mentee[1].surname).to eq("Y")
            expect(Mentee[1].email).to eq("testtest123@test.test")
            expect(Mentee[1].year_of_study).to eq(1)
            expect(Mentee[1].biography).to eq("i love playing cricket")
            expect(Mentee[1].course).to eq("Maths")
        end
    end
end