require_relative "../../helpers/spec_helper"

RSpec.describe "Admin Form" do
    describe "GET /admin-form" do
        it "has a status code of 200 (OK)" do
            get "/admin-form"
            expect(last_response.status).to eq(200)
        end
        
        it "includes a form" do
            get "/admin-form"
            expect(last_response.body).to include('<form method="post" id="form-style">')
        end
    end
end