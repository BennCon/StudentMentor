require_relative "../../helpers/spec_helper.rb"

describe "Admin emails" do
    it "are displayed to mentees" do
        Code.unrestrict_primary_key
        code = Code.new(id: 15, code: "thecode", used: 0)
        code.save_changes
        register_admin "TestAdmin","thecode","admintest123@test.com"
        register_mentee "MenteeFirst","MenteeSur","TestMentee","Male","1st","mentee123@test.com"
        log_in "TestMentee"
        click_link '> Get Help'
        # Emails of admin accounts should show up on the mentee help page
        expect(page).to have_content("admintest123@test.com")
    end
    it "are displayed to mentors" do
        register_mentor "MentorFirst","Surname","TestMentor","Male","Aerospace","Aerospace","mentortest@test.com"
        log_in "TestMentor"
        click_link '> Get Help'
        # Emails of admin accounts should show up on the mentor help page
        expect(page).to have_content("admintest123@test.com")
        clear_db
    end
end