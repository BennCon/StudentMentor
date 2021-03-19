require_relative "../../helpers/spec_helper"

RSpec.describe "My Account Mentor" do
    describe "GET /my-account-mentor" do
        it "has a status code of 200 (OK)" do
            mentor = Mentor.new(first_name: "A", surname: "B", industry: "ABCDEF", company:"ABCDE", email: "123@AB.CDE", password: "pass", sheffield_graduate: true, degree_field: "ABCD")
            mentor.save_changes
            get "/my-account-mentor", "id"=>mentor.id
            expect(last_response.status).to eq(200)
            DB.from("mentors").delete
        end
        
        it "Has profile information" do
            mentor = Mentor.new(first_name: "A", surname: "B", industry: "ABCDEF", company:"ABCDE", email: "123@AB.CDE", password: "pass", sheffield_graduate: true, degree_field: "ABCD")
            mentor.save_changes
            get "/my-account-mentor", "id"=>mentor.id
            expect(last_response.body).to include('<section id="information">', '<section id="profile">')
            DB.from("mentors").delete
        end
    end
end