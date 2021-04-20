require_relative "../../helpers/spec_helper"

RSpec.describe "My Account Admin" do
    describe "GET /my-account-admin" do
        
        before(:all) do
            User.unrestrict_primary_key
            Admin.unrestrict_primary_key
            user = User.new(email: "testtest@test.test", password: "test1234", user_type: "admin", id:9999)
            user.save_changes
            admin = Admin.new(first_name: "Test", surname: "Test", admin_code: "1234", email: "testtest@test.test", password: "test1234", id:9999)
            admin.save_changes
            post "/", "email" => "testtest@test.test", "password" => "test1234"
        end
        
        after(:all) do
            DB.from("mentees").delete
            DB.from("mentors").delete
            DB.from("admins").delete
            DB.from("users").delete
        end
        
        it "has a status code of 200 (OK)" do
            get "/my-account-admin"
            expect(last_response.status).to eq(200)
        end
        
        it "Has profile information" do
            get "/my-account-admin"
            expect(last_response.body).to include('First name', 'Test')
        end
    end
end