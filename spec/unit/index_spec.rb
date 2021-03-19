require_relative "../../helpers/spec_helper"

RSpec.describe "Index" do
    describe "GET /" do
        it "has a status code of 200 (OK)" do
            post "/"
            expect(last_response.status).to eq(200)
        end
        
        it "includes a welcome and a sign-in" do
            post "/"
            expect(last_response.body).to include('welcome', 'sign', '<form method="post">')
        end
    end
    
    describe "Index Form Submission" do
        it "Redirects on a success" do
            admin = Admin.new(first_name: "Test", surname: "Test", admin_code: "1234", email: "testtest@test.test", password: "test1234")
            admin.save_changes
            post "/", "email" => "testtest@test.test", "password" => "test1234"
            expect(last_response).to be_redirect
            expect(last_response.location).to include('/my-account-admin')
            DB.from("admin").delete
        end
        
        it "Fails when there's no password" do
            admin = Admin.new(first_name: "Test", surname: "Test", admin_code: "1234", email: "testtest@test.test", password: "test1234")
            admin.save_changes
            post "/", "email" => "testtest@test.test"
            expect(last_response).to include('Error')
            DB.from("admin").delete
        end
        
        it "Fails when there's no email" do
            admin = Admin.new(first_name: "Test", surname: "Test", admin_code: "1234", email: "testtest@test.test", password: "test1234")
            admin.save_changes
            post "/", "password" => "test1234"
            expect(last_response).to include('Error')
            DB.from("admin").delete
        end
        
        it "Fails when there's no parameters" do
            admin = Admin.new(first_name: "Test", surname: "Test", admin_code: "1234", email: "testtest@test.test", password: "test1234")
            admin.save_changes
            post "/"
            expect(last_response).to include('Error')
            DB.from("admin").delete
        end
        
        it "Fails when a false email is inputted" do
            admin = Admin.new(first_name: "Test", surname: "Test", admin_code: "1234", email: "testtest@test.test", password: "test1234")
            admin.save_changes
            post "/", "email" => "test", "password" => "test1234"
            expect(last_response).to include('Error')
            DB.from("admin").delete
        end
    end
end