require_relative "../../helpers/spec_helper.rb"

describe "A mentee" do
    it "should be able to see their mentees email to contact them" do
        register_mentee "MenteeFirst","MenteeSur","TestMentee","Male","1st","mentee123@test.com"
        register_mentor "MentorFirst","Surname","TestMentor","Male","Aerospace","Aerospace","mentortest@test.com"
        log_in "TestMentee"
        # The mentee needs to request the mentor
        click_link "> Find A Mentor"
        click_button "Request"
        visit "/find-mentor"
        click_link "> Logout"
        log_in "TestMentor"
        # The mentor accepts the request
        click_link "> My Requests"
        click_button "Accept"
        click_link "> Logout"
        log_in "TestMentee"
        click_link "> My Requests"
        # The mentee should now be able to see the mentors email
        expect(page).to have_content("mentortest@test.com")
        clear_db
    end
end