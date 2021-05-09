require_relative "../../helpers/spec_helper.rb"

describe "A mentor" do
    it "can be declined by their current mentee" do
        register_mentee "MenteeFirst","MenteeSur","TestMentee","Male","mentee123@test.com"
        register_mentor "MentorFirst","Surname","TestMentor","Male","Aerospace","Aerospace","mentortest@test.com"
        # Request the mentor
        log_in "TestMentee"
        click_link '> Find A Mentor'
        click_button "Request"
        visit "/find-mentor"
        click_link "> Logout"
        # The mentor accepts the request
        log_in "TestMentor"
        click_link '> My Requests'
        click_button "Accept"
        expect(page).to have_content("MenteeFirst")
        click_link "> Logout"
        log_in "TestMentee"
        click_link '> My Requests'
        # The mentor should show up on the page for the mentee
        expect(page).to have_content("MentorFirst")
        click_button "Delete"
        # After deleting the current link, the mentor should no longer show up
        expect(page).not_to have_content("MentorFirst")
    end
    it "can see that they have been declined by their mentee" do
        log_in "TestMentor"
        click_link '> My Requests'
        # The mentee should also no longer show up on the mentors page
        expect(page).not_to have_content("MenteeFirst")
        clear_db
    end
end