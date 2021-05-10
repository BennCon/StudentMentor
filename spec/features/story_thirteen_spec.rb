require_relative "../../helpers/spec_helper.rb"

describe "An admin" do
    it "can view a mentees request count" do
        Code.unrestrict_primary_key
        code = Code.new(id: 55, code: "codetest", used: 0)
        code.save_changes
        register_admin "TestAdmin","codetest","admintest@test.com"
        register_mentee "MenteeFirst","MenteeSur","TestMentee","Male","2nd","mentee123@test.com"
        log_in "TestAdmin"
        click_link '> All Mentees'
        # The request count should intially be 0 for a new mentee account
        expect(page).to have_content(" 0 ")
    end
    it "can see an updated request count after the mentee makes more requests" do
        # Make the mentee account contact a mentor, then get admin to check
        register_mentor "MentorFirst","Surname","TestMentor","Male","Aerospace","Aerospace","mentortest@test.com"
        log_in "TestMentee"
        click_link "> Find A Mentor"
        click_button "Request"
        visit "/find-mentor"
        click_link "> Logout"
        log_in "TestAdmin"
        click_link "> All Mentees"
        expect(page).to have_content(" 1 ")
    end
    it "can ban a mentee" do
        # The admin can change the user's password to something only known by the admin to ban them
        log_in "TestAdmin"
        click_link "> All Mentees"
        click_button 'change_passw'
        fill_in "id", with: "2"
        fill_in "password", with: "banhammer"
        click_button 'save'
        click_link "> Logout"
        log_in "TestMentee"
        expect(page).not_to have_content("MenteeFirst")
        clear_db
    end
end