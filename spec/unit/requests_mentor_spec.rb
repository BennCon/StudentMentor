require_relative "../../helpers/spec_helper"

RSpec.describe "Requests Page" do
    describe "GET /requests" do
        
        before(:all) do
            User.unrestrict_primary_key
            Mentor.unrestrict_primary_key
            user = User.new(email: "testtest@test.test", password: "test1234", user_type: "mentor", id:9999)
            user.save_changes
            mentor = Mentor.new(first_name: "A", surname: "B", industry: "ABCDEF", company:"ABCDE", email: "testtest@test.test", password: "test1234", sheffield_graduate: true, degree_field: "ABCD", id:9999)
            mentor.save_changes
            post "/", "email" => "testtest@test.test", "password" => "test1234"
        end
        
        after(:all) do
            DB.from("mentees").delete
            DB.from("mentors").delete
            DB.from("admins").delete
            DB.from("users").delete
        end
        
        it "has a status code of 200 (OK)" do
            get "/requests-mentor"
            expect(last_response.status).to eq(200)
        end
        
        it "Displays requests" do
            get "/requests-mentor"
            expect(last_response.body).to include('requests')
        end
    end
end