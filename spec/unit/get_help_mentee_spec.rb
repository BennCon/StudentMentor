require_relative "../../helpers/spec_helper"

RSpec.describe "Get Help" do
    describe "GET /get-help-mentee" do
        
        before(:all) do
            User.unrestrict_primary_key
            Mentee.unrestrict_primary_key
            user = User.new(email: "testtest@test.test", password: "test1234", user_type: "mentee", id:9999)
            user.save_changes
            mentee = Mentee.new(first_name: "A", surname: "B", course: "ABCD", year_of_study: 9999, email: "testtest@test.test", password: "test1234", id:9999)
            mentee.save_changes
            post "/", "email" => "testtest@test.test", "password" => "test1234"
        end
        
        after(:all) do
            DB.from("mentees").delete
            DB.from("mentors").delete
            DB.from("admins").delete
            DB.from("users").delete
        end
        
        it "has a status code of 200 (OK)" do
            get "/get-help-mentee"
            expect(last_response.status).to eq(200)
        end
        
        it "includes a frequently asked question section" do
            get "/get-help-mentee"
            expect(last_response.body).to include('FAQ')
        end
    end
end