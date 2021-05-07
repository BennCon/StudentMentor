require_relative "../../helpers/spec_helper.rb"

describe "A user" do
    it "can have their password changed by an admin" do
        register_mentee "MenteeFirst","MenteeSur","TestMentee","Male","mentee123@test.com"
        Code.unrestrict_primary_key
        code = Code.new(id: 45, code: "qwerty", used: 0)
        code.save_changes
        register_admin "TestAdmin","qwerty","admintest@test.com"
        log_in "TestAdmin"
        click_link "> All Mentees"
        expect(page).to have_button('change_passw')
        #Change the mentees password to 'newtestpass' for the next test
        click_button 'change_passw'
        fill_in "id", with: "1"
        fill_in "password", with: "newtestpass"
        click_button 'save'
    end
    it "can only log in with a changed password" do
        log_in "TestMentee"
        expect(page).to have_content("incorrect")
        fill_in "username", with: "TestMentee"
        fill_in "password", with: "newtestpass"
        click_button "signin"
        expect(page).to have_content("MenteeFirst")
        clear_db
    end
end