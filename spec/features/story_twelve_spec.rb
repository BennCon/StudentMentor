require_relative "../../helpers/spec_helper.rb"

describe "An Admin" do
    it "should be able to see a list of all mentees" do
        Code.unrestrict_primary_key
        code = Code.new(id: 65, code: "testcode", used: 0)
        code.save_changes
        register_admin "TestAdmin","testcode","admintest@test.com"
        register_mentee "MenteeOne","SurOne","TestMentee1","Male","mentee123@test.com"
        register_mentee "MenteeTwo","SurTwo","TestMentee2","Female","mentee456@test.com"
        log_in "TestAdmin"
        click_link '> All Mentees'
        # All of the newly created mentee accounts should be visible to an admin on the page
        expect(page).to have_content("TestMentee1")
        expect(page).to have_content("TestMentee2")
        clear_db
    end
end