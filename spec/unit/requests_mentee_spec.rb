require_relative "../../helpers/spec_helper"

RSpec.describe "Requests Page" do
    describe "GET /requests" do
        
        before(:all) do
            User.unrestrict_primary_key
            Mentee.unrestrict_primary_key
            user = User.new(password: "test1234", user_type: "mentee", id:9999)
            user.save_changes
            mentee = Mentee.new(username: "user", first_name: "A", surname: "B", course: "ABCD", year_of_study: 9999, email: "testtest@test.test", password: "test1234", id:9999)
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
            get "/requests-mentee"
            expect(last_response.status).to eq(200)
        end
        
        it "Displays requests" do
            get "/requests-mentee"
            expect(last_response.body).to include('requests')
        end
    end
end