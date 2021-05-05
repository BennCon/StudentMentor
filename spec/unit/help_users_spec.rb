require_relative "../../helpers/spec_helper"

RSpec.describe "User Help" do
    describe "GET /help-users" do
        before(:all) do
            create_mentee_model
            post "/", "username" => "user", "password" => "test1234"
        end
        
        after(:all) do
            clear_db
        end
        
        it "has a status code of 200 (OK)" do
            get "/help-users"
            expect(last_response.status).to eq(200)
        end
        
        it "includes a page with visible help items and ability to add Q and A" do
            get "/help-users"
            expect(last_response.body).to include('<form method="post" action="/help-users" class="accDetails" id="faq_form">','<div id="mentee_help">','<div class="hide" id="mentor_help">')
        end
    end
end