require_relative "../../helpers/spec_helper.rb"

describe "A mentee" do
    it "can have their request denied by a mentor" do
        register_mentee "MenteeFirst","MenteeSur","TestMentee","Male","mentee123@test.com"
        register_mentor "MentorFirst","Surname","TestMentor","Male","Aerospace","Aerospace","mentortest@test.com"
        log_in "TestMentee"
        click_link "> Find A Mentor"
        click_button "Request"
        click_link "> Logout"
        log_in "TestMentor"
        click_link "> My Requests"
        expect(page).to have_content("MenteeFirst")
        expect(page).to have_button("Reject")
        click_button "Reject"
    end
    it "can see that their request has been denied" do
        log_in "TestMentee"
        click_link "> My Requests"
        expect(page).not_to have_content("MentorFirst")
    end
    it "can request a mentor again after being denied" do
        log_in "TestMentee"
        click_link "> Find A Mentor"
        click_button "Request"
        click_link "> My Requests"
        expect(page).to have_content("MentorFirst")
        clear_db
    end
end