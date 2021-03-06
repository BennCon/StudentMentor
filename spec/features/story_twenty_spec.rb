require_relative "../../helpers/spec_helper.rb"

describe "A Mentor" do
    it "has the option to respond once through the website to a request" do
        register_mentee "MenteeFirst","MenteeSur","TestMentee","Male","1st","mentee123@test.com"
        register_mentor "MentorFirst","Surname","TestMentor","Male","Aerospace","Aerospace","mentortest@test.com"
        log_in "TestMentee"
        # A mentee requests a mentor
        click_link "> Find A Mentor"
        click_button "Request"
        visit "/find-mentor"
        click_link "> Logout"
        log_in "TestMentor"
        click_link "> My Requests"
        # The mentor can respond to the request
        expect(page).to have_button("Accept")
        expect(page).to have_button("Reject")
        clear_db
    end
end