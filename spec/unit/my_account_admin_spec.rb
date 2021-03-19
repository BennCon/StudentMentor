require_relative "../../helpers/spec_helper"

RSpec.describe "My Account Admin" do
    describe "GET /my-account-admin" do
        it "has a status code of 200 (OK)" do
            admin = Admin.new(first_name: "Test", surname: "Test", admin_code: "1234", email: "testtest@test.test", password: "test1234")
            admin.save_changes
            get "/my-account-admin", "id"=>admin.id
            expect(last_response.status).to eq(200)
            DB.from("admins").delete
        end
        
        it "Has profile information" do
            admin = Admin.new(first_name: "Test", surname: "Test", admin_code: "1234", email: "testtest@test.test", password: "test1234")
            admin.save_changes
            get "/my-account-admin", "id"=>admin.id
            expect(last_response.body).to include('First name', 'Test')
            DB.from("admins").delete
        end
    end
end