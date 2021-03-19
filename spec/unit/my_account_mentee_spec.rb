require_relative "../../helpers/spec_helper"

RSpec.describe "My Account Mentee" do
    describe "GET /my-account-mentee" do
        it "has a status code of 200 (OK)" do
            mentee = Mentee.new(first_name: "A", surname: "B", course: "ABCD", year_of_study: 9999, email: "123@AB.CDE", password: "pass")
            mentee.save_changes
            get "/my-account-mentee", "id"=>mentee.id
            expect(last_response.status).to eq(200)
            DB.from("mentees").delete
        end
        
        it "Has profile information" do
            mentee = Mentee.new(first_name: "A", surname: "B", course: "ABCD", year_of_study: 9999, email: "123@AB.CDE", password: "pass")
            mentee.save_changes
            get "/my-account-mentee", "id"=>mentee.id
            expect(last_response.body).to include('<section id="information">', '<section id="profile">', 'A', 'B', '9999', '123@AB.CDE')
            DB.from("mentees").delete
        end
    end
end