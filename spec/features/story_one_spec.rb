require_relative "../../helpers/spec_helper.rb"

describe "The sign up pages" do
    it "can create mentee accounts" do
        register_mentee "MenteeFirst","MenteeSur","TestMentee","Male","1st","mentee123@test.com"
        log_in "TestMentee"
        # If they have logged in successfully, they will be on their account page that includes their name
        expect(page).to have_content "MenteeFirst"
    end
        
    it "can create mentor accounts" do
        register_mentor "MentorFirst","Surname","TestMentor","Male","Aerospace","Aerospace","mentortest@test.com"
        log_in "TestMentor"
        expect(page).to have_content "MentorFirst"
        clear_db
    end
end