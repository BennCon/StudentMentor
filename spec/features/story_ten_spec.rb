require_relative "../../helpers/spec_helper.rb"

describe "A mentee" do
    it "can have their request denied by a mentor" do
        register_mentee "MenteeFirst","MenteeSur","TestMentee","Male","mentee123@test.com"
        register_mentor "MentorOne","SurOne","TestMentor1","Male","Aerospace","Aerospace","mentortest123@test.com"
        # Request a mentor
        log_in "TestMentee"
        click_link "> Find A Mentor"
        click_button "Request"
        visit "/find-mentor"
        click_link "> Logout"
        log_in "TestMentor1"
        click_link "> My Requests"
        # The mentees request should show up, along with a 'reject' button
        expect(page).to have_content("MenteeFirst")
        expect(page).to have_button("Reject")
        click_button "Reject"
    end
    it "can see that their request has been denied" do
        log_in "TestMentee"
        click_link "> My Requests"
        # The mentee should no longer see the request as 'pending' (or at all)
        expect(page).not_to have_content("MentorOne")
    end
    it "can request new mentors after being denied" do
        register_mentor "MentorTwo","SurTwo","TestMentor2","Male","Aerospace","Aerospace","mentortest456@test.com"
        log_in "TestMentee"
        click_link "> Find A Mentor"
        # The mentee should be able to request a mentor again after being denied
        click_button "Request"
        visit "/find-mentor"
        click_link "> My Requests"
        expect(page).to have_content("MentorTwo")
        clear_db
    end
end