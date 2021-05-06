require_relative "../../helpers/spec_helper"

RSpec.describe "Mentor Form" do
    describe "GET /mentor-form" do
        it "has a status code of 200 (OK)" do
            get "/mentor-form"
            expect(last_response.status).to eq(200)
        end
        
        it "includes a form" do
            get "/mentor-form"
            expect(last_response.body).to include('<form method="post" id="form-style">')
        end
    end
    
    describe "POST /mentor-form" do
        
        after(:all) do
            clear_db
        end
        
        it "redirects to index on a success" do
            post "/mentor-form", "first_name" => "A", "username"=> "user", "surname"=> "B", "industry"=> "ABCDEF", "gender"=>"male", "company"=>"ABCDE", "email"=> "testtest@test.test", "password"=> "test1234", "sheffield_graduate"=> 1, "degree_field"=> "ABCD", "mentor_submit"=>""
            expect(last_response.status).to eq(302)
            expect(last_response.location).to eq("http://example.org/success")
        end
        
        it "Fails when there's no password" do
            post "/mentor-form", "first_name" => "A", "username"=> "user", "surname"=> "B", "industry"=> "ABCDEF", "gender"=>"male", "company"=>"ABCDE", "email"=> "testtest@test.test", "password"=> "", "sheffield_graduate"=> 1, "degree_field"=> "ABCD", "mentor_submit"=>""
            expect(last_response.body).to include("Password cannot be empty")
        end
        
        it "Fails when password too short" do
            post "/mentor-form", "first_name" => "A", "username"=> "user", "surname"=> "B", "industry"=> "ABCDEF", "gender"=>"male", "company"=>"ABCDE", "email"=> "testtest@test.test", "password"=> "test", "sheffield_graduate"=> 1, "degree_field"=> "ABCD", "mentor_submit"=>""
            expect(last_response.body).to include("Password must contain at least 5 characters")
        end
        
        it "Fails when an email is already used" do
            create_mentor_model
            post "/mentor-form", "first_name" => "A", "username"=> "user123", "surname"=> "B", "industry"=> "ABCDEF", "gender"=>"male", "company"=>"ABCDE", "email"=> "testtest@test.test", "password"=> "test1234", "sheffield_graduate"=> 1, "degree_field"=> "ABCD", "mentor_submit"=>""
            expect(last_response.body).to include("Email is alrady registered to another account")
        end
        
        it "Fails when a username is already used" do
            create_mentor_model
            post "/mentor-form", "first_name" => "A", "username"=> "user", "surname"=> "B", "industry"=> "ABCDEF", "gender"=>"male", "company"=>"ABCDE", "email"=> "testtest@test.test", "password"=> "test1234", "sheffield_graduate"=> 1, "degree_field"=> "ABCD", "mentor_submit"=>""
            expect(last_response.body).to include("Username is already registered to another account")
        end
    end
end