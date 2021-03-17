require_relative "../../helpers/spec_helper"

RSpec.describe "Requests Page" do
    describe "GET /requests" do
        it "has a status code of 200 (OK)" do
            get "/requests"
            expect(last_response.status).to eq(200)
        end
        
        it "Displays requests" do
            get "/requests"
            expect(last_response.body).to include('requests')
        end
    end
end