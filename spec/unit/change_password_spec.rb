require_relative "../../helpers/spec_helper"

RSpec.describe "Mentor Form" do
    describe "POST /change-password as mentor" do
        
        before(:all) do
            create_mentor_model
            post "/", "username" => "user", "password" => "test1234"
        end
        
        after(:all) do
            clear_db
        end
        
        it "redirects to all mentors on a success" do
            post "/change-password", "id" => 1, "password"=> "test4567"
            expect(last_response.status).to eq(302)
            expect(last_response.location).to eq("http://example.org/all-mentors")
        end
        
        it "changes the password successfully" do
            post "/change-password", "id" => 1, "password"=> "test4567"
            expect(Mentor[1].password).to eq("test4567")
        end
    end
    
    describe "POST /change-password as mentee" do
        
        before(:all) do
            create_mentee_model
            post "/", "username" => "user", "password" => "test1234"
        end
        
        after(:all) do
            clear_db
        end
        
        it "redirects to all mentees on a success" do
            post "/change-password", "id" => 1, "password"=> "test4567"
            expect(last_response.status).to eq(302)
            expect(last_response.location).to eq("http://example.org/all-mentees")
        end
        
        it "changes the password successfully" do
            post "/change-password", "id" => 1, "password"=> "test4567"
            expect(Mentee[1].password).to eq("test4567")

        end
    end
end