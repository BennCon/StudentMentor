require_relative "../../helpers/spec_helper.rb"

describe "The sign up pages" do
    it "Can create mentee accounts" do
        register_mentee "MenteeFirst","MenteeSur","TestMentee","Male","mentee123@test.com"
        log_in "TestMentee"
        expect(page).to have_content "MenteeFirst"
    end
        
    it "Can create mentor accounts" do
        register_mentor "MentorFirst","Surname","TestMentor","Male","Aerospace","Aerospace","mentortest@test.com"
        log_in "TestMentor"
        expect(page).to have_content "MentorFirst"
        clear_db
    end
end