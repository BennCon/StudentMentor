require_relative "../../helpers/spec_helper"

RSpec.describe "Index" do
    describe "GET /" do
        it "has a status code of 200 (OK)" do
            get "/"
            expect(last_response.status).to eq(200)
        end
        
        it "includes a welcome and a sign-in" do
            get "/"
            expect(last_response.body).to include('welcome', 'sign')
        end
    end
end