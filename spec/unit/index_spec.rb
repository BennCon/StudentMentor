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
            user = User.new(password: "test1234", user_type: "admin")
            user.save_changes
            admin = Admin.new(username: "user", first_name: "A", surname: "B", admin_code: "1234", email: "testtest@test.test", password: "test1234")
            admin.save_changes
        end
        
        after(:all) do
            DB.from("mentees").delete
            DB.from("mentors").delete
            DB.from("admins").delete
            DB.from("users").delete
        end
        
        it "Redirects on a success" do
            post "/", "email" => "testtest@test.test", "password" => "test1234"
            expect(last_response).to be_redirect
            expect(last_response.location).to include('/my-account-admin')
        end
        
        it "Fails when there's no password" do
            post "/", "email" => "testtest@test.test"
            expect(last_response.body).to include('Username/Password combination incorrect')
        end
        
        it "Fails when there's no email" do
            post "/", "password" => "test1234"
            expect(last_response.body).to include('Username/Password combination incorrect')
        end
        
        it "Fails when there's no parameters" do
            post "/"
            expect(last_response.body).to include('Username/Password combination incorrect')
        end
        
        it "Fails when a false email is inputted" do
            post "/", "email" => "test", "password" => "test1234"
            expect(last_response.body).to include('Username/Password combination incorrect')
        end
    end
end