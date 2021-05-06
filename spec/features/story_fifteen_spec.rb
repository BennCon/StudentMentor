require_relative "../../helpers/spec_helper.rb"

describe "A mentor's email" do
    it "is hidden to a mentee before a match is made" do
        register_mentee "MenteeFirst","MenteeSur","TestMentee","Male","mentee123@test.com"
        register_mentor "MentorFirst","Surname","TestMentor","Male","Aerospace","Aerospace","mentortest@test.com"
        log_in "TestMentee"
        click_link "> Find A Mentor"
        click_button "Request"
        click_link "> My Requests"
        expect(page).not_to have_content("mentortest@test.com")
    end
    it "is shown to a mentee after a match is made" do
        log_in "TestMentor"
        click_link "> My Requests"
        click_button "Accept"
        click_link "> Logout"
        log_in "TestMentee"
        click_link "> My Requests"
        expect(page).to have_content("mentortest@test.com")
        clear_db
    end
end