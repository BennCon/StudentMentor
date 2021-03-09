require_relative "../../helpers/spec_helper"

RSpec.describe "Mentor Form" do
    describe "GET /mentor-form" do
        it "has a status code of 200 (OK)" do
            get "/mentor-form"
            expect(last_response.status).to eq(200)
        end
        
        it "includes a form" do
            get "/mentor-form"
            expect(last_response.body).to include('<form method="post">')
        end
    end
end