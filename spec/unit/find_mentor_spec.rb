require_relative "../../helpers/spec_helper"

RSpec.describe "Find Mentor" do
    describe "GET /find-mentor" do
        it "has a status code of 200 (OK)" do
            get "/find-mentor"
            expect(last_response.status).to eq(200)
        end
        
        it "Has an availabe mentors section" do
            get "/find-mentor"
            expect(last_response.body).to include('Available Mentors')
        end
    end
end