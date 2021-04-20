require_relative "../../helpers/spec_helper"

RSpec.describe "My Account Mentee" do
    describe "GET /my-account-mentee" do
        it "has a status code of 200 (OK)" do
            get "/my-account-mentee"
            expect(last_response.status).to eq(200)
        end
        
        it "Has profile information" do
            get "/my-account-mentee"
            expect(last_response.body).to include('<section id="information">', '<section id="profile">')
        end
    end
end