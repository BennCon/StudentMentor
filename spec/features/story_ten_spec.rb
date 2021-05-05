require_relative "../../helpers/spec_helper.rb"

describe "A mentor" do
    it "has the option to decline mentee requests" do
        register_mentee "MenteeFirst","MenteeSur","TestMentee","Male","mentee123@test.com"
        register_mentor "MentorFirst","Surname","TestMentor","Male","Aerospace","Aerospace","mentortest@test.com"
        log_in "TestMentee"
        click_link "> Find A Mentor"
        click_button "Request"
        click_link "> Logout"
        log_in "TestMentor"
        click_link "> My Requests"
        expect(page).to have_button('Decline')
        #Click button then check that this removes any mention of a request
        clear_db
    end
end