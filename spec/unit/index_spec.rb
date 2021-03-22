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
        it "Redirects on a success" do
            user = User.new(email: "testtest@test.test", password: "test1234", user_type: "admin")
            user.save_changes
            post "/", "email" => "testtest@test.test", "password" => "test1234"
            expect(last_response).to be_redirect
            expect(last_response.location).to include('/my-account-admin')
            user.delete
        end
        
        it "Fails when there's no password" do
            user = User.new(email: "testtest@test.test", password: "test1234", user_type: "admin")
            user.save_changes
            post "/", "email" => "testtest@test.test"
            expect(last_response.body).to include('Username/Password combination incorrect')
            user.delete
        end
        
        it "Fails when there's no email" do
            user = User.new(email: "testtest@test.test", password: "test1234", user_type: "admin")
            user.save_changes
            post "/", "password" => "test1234"
            expect(last_response.body).to include('Username/Password combination incorrect')
            user.delete
        end
        
        it "Fails when there's no parameters" do
            user = User.new(email: "testtest@test.test", password: "test1234", user_type: "admin")
            user.save_changes
            post "/"
            expect(last_response.body).to include('Username/Password combination incorrect')
            user.delete
        end
        
        it "Fails when a false email is inputted" do
            user = User.new(email: "testtest@test.test", password: "test1234", user_type: "admin")
            user.save_changes
            post "/", "email" => "test", "password" => "test1234"
            expect(last_response.body).to include('Username/Password combination incorrect')
            user.delete
        end
    end
end