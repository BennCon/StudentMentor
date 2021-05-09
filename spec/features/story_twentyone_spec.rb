require_relative "../../helpers/spec_helper.rb"

describe "Help Page updates" do
    it "can be done by admins" do
        Code.unrestrict_primary_key
        code = Code.new(id: 55, code: "codetest", used: 0)
        code.save_changes
        register_admin "TestAdmin","codetest","admintest@test.com"
        log_in "TestAdmin"
        click_link '> Help Users'
        # An admin should have the option to add FAQs to the help pages
        expect(page).to have_button('add_faq')
        # Need to add FAQs to the help page so they can be checked
        click_button 'add_faq'
        fill_in "question", with: "TestQuestion"
        fill_in "answer", with: "TestAnswer"
        choose 'mentee'
        click_button "save"
    end
    it "can be seen by mentees" do
        register_mentee "MenteeFirst","MenteeSur","TestMentee","Male","mentee123@test.com"
        log_in "TestMentee"
        click_link '> Get Help'
        # The added FAQ should be visible to the mentee
        expect(page).to have_content("TestQuestion")
        expect(page).to have_content("TestAnswer")
        clear_db
    end
end