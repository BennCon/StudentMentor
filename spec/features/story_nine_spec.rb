require_relative "../../helpers/spec_helper.rb"

describe "A mentor" do
    it "can be declined by their current mentee" do
        register_mentee "MenteeFirst","MenteeSur","TestMentee","Male","mentee123@test.com"
        register_mentor "MentorFirst","Surname","TestMentor","Male","Aerospace","Aerospace","mentortest@test.com"
        log_in "TestMentee"
        click_link '> Find A Mentor'
        click_button "Request"
        click_link "> Logout"
        log_in "TestMentor"
        click_link '> My Requests'
        click_button "Accept"
        expect(page).to have_content("MenteeFirst")
        click_link "> Logout"
        log_in "TestMentee"
        click_link '> My Requests'
        expect(page).to have_content("MentorFirst")
        click_button "Delete"
        expect(page).not_to have_content("MentorFirst")
    end
    it "can see that they have been declined by their mentee" do
        log_in "TestMentor"
        click_link '> My Requests'
        expect(page).not_to have_content("MenteeFirst")
        clear_db
    end
end