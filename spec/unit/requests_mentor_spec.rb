require_relative "../../helpers/spec_helper"

RSpec.describe "Requests Page" do
    describe "GET /requests-mentor" do
        
        before(:all) do
            create_mentor_model
            post "/", "username" => "user", "password" => "test1234"
        end
        
        after(:all) do
            clear_db
        end
        
        it "has a status code of 200 (OK)" do
            get "/requests-mentor"
            expect(last_response.status).to eq(200)
        end
        
        it "Displays requests" do
            get "/requests-mentor"
            expect(last_response.body).to include('requests')
        end
    end
    
    describe "POST /acceptMethod" do
        
        before(:all) do
            create_mentor_model
            user = User.new(username: "user1", password: "test1234", user_type: "mentee")
            user.save_changes(:validate => false)
            mentee = Mentee.new(username: "user1", first_name: "A", surname: "B", course: "ABCD", year_of_study: 9999, email: "test1@test.test", password: "test1234")
            mentee.save_changes(:validate => false)
            post "/", "username" => "user", "password" => "test1234"
        end
        
        after(:all) do
            clear_db
        end
        
        it "accepts a request" do
            request = Request.new(mentee_id: 2, mentor_id: 1, accepted: 0)
            request.save_changes
            post "/acceptMethod", "menteeId" => 1
            puts request.accepted
            expect(request.accepted).to eq(1)
        end
        
         it "can't accept a request with wrong mentor_id" do
            request = Request.new(mentee_id: 2, mentor_id: 200, accepted: 0)
            request.save_changes
            post "/acceptMethod", "menteeId" => 1
            puts request.accepted
            expect(request.accepted).to eq(1)
         end
    end
    
    describe "POST /rejectMethod" do
        
        before(:all) do
            create_mentor_model
            user = User.new(username: "user1", password: "test1234", user_type: "mentee")
            user.save_changes(:validate => false)
            mentee = Mentee.new(username: "user1", first_name: "A", surname: "B", course: "ABCD", year_of_study: 9999, email: "test1@test.test", password: "test1234")
            mentee.save_changes(:validate => false)
            post "/", "username" => "user", "password" => "test1234"
        end
        
        after(:all) do
            clear_db
        end
        
        it "rejects a request" do
            request = Request.new(mentee_id: 1, mentor_id: 1, accepted: 0)
            request.save_changes
            post "/rejectMethod", "menteeId" => 1
            expect(request.accepted).to eq(2)
        end
        
         it "can't accept a request with wrong mentor_id" do
            request = Request.new(mentee_id: 1, mentor_id: 200, accepted: 0, id:1)
            request.save_changes
            post "/rejectMethod", "menteeId" => 1
            expect(request.accepted).to eq(2)
         end
    end
end