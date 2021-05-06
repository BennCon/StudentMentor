require_relative "../../helpers/spec_helper"

RSpec.describe "Mentee Form" do
    describe "GET /mentee-form" do
        it "has a status code of 200 (OK)" do
            get "/mentee-form"
            expect(last_response.status).to eq(200)
        end
        
        it "includes a form" do
            get "/mentee-form"
            expect(last_response.body).to include('<form method="post" id="form-style">')
        end
    end
    
    describe "POST /mentee-form" do
        
        after(:all) do
            clear_db
        end
        
        it "redirects to index on a success" do
            post "/mentee-form", "first_name" => "A", "username"=> "user", "surname"=> "B", "gender"=>"male", "course"=>"test", "email"=> "testtest@test.test", "password"=> "test1234", "university"=>"University of Sheffield", "year_of_study"=> 1, "mentee_submit"=>""
            expect(last_response.status).to eq(302)
            expect(last_response.location).to eq("http://example.org/success")
        end
        
        it "Fails when there's no password" do
            post "/mentee-form", "first_name" => "A", "username"=> "user", "surname"=> "B", "gender"=>"male", "course"=>"test", "email"=> "testtest@test.test", "password"=> "", "university"=>"University of Sheffield", "year_of_study"=> 1, "mentee_submit"=>""
            expect(last_response.body).to include("Password cannot be empty")
        end
        
        it "Fails when password too short" do
            post "/mentee-form", "first_name" => "A", "username"=> "user", "surname"=> "B", "gender"=>"male", "course"=>"test", "email"=> "testtest@test.test", "password"=> "test", "university"=>"University of Sheffield", "year_of_study"=> 1, "mentee_submit"=>""
            expect(last_response.body).to include("Password must contain at least 5 characters")
        end
        
        it "Fails when an email is already used" do
            create_mentee_model
            post "/mentee-form", "first_name" => "A", "username"=> "user", "surname"=> "B", "gender"=>"male", "course"=>"test", "email"=> "testtest@test.test", "password"=> "test1234", "university"=>"University of Sheffield", "year_of_study"=> 1, "mentee_submit"=>""
            expect(last_response.body).to include("Email is alrady registered to another account")
        end
        
        it "Fails when a username is already used" do
            create_mentee_model
            post "/mentee-form", "first_name" => "A", "username"=> "user", "surname"=> "B", "gender"=>"male", "course"=>"test", "email"=> "testtest@test.test", "password"=> "test1234", "university"=>"University of Sheffield", "year_of_study"=> 1, "mentee_submit"=>""
            expect(last_response.body).to include("Username is already registered to another account")
        end
    end
end