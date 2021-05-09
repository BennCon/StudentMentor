require_relative "../../helpers/spec_helper.rb"

describe "A mentee's email" do
    it "is hidden to a mentor before a match is made" do
        register_mentee "MenteeFirst","MenteeSur","TestMentee","Male","1st","mentee123@test.com"
        register_mentor "MentorFirst","Surname","TestMentor","Male","Aerospace","Aerospace","mentortest@test.com"
        log_in "TestMentee"
        click_link "> Find A Mentor"
        click_button "Request"
        visit "/find-mentor"
        click_link "> Logout"
        log_in "TestMentor"
        click_link "> My Requests"
        # A currently pending request should not show the email to the mentor
        expect(page).not_to have_content("mentee123@test.com")
    end
    it "is shown to a mentor after a match is made" do
        log_in "TestMentor"
        click_link "> My Requests"
        click_button "Accept"
        # After the request is accepted it does show the email to the mentor
        expect(page).to have_content("mentee123@test.com")
        clear_db
    end
end