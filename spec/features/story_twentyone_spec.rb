require_relative "../../helpers/spec_helper.rb"

describe "Help Page updates" do
    it "can be done by admins" do
        Code.unrestrict_primary_key
        code = Code.new(id: 55, code: "codetest", used: 0)
        code.save_changes
        register_admin "TestAdmin","testcode","admintest@test.com"
        log_in "TestAdmin"
        click_link '> Mentee Help'
        #Admins need to have access to the help page, when they do
        #This needs to go to the help page, change it by adding 'test123', then checking that it has been added correctly
    end
    it "can be seen by mentees" do
        register_mentee "MenteeFirst","MenteeSur","TestMentee","Male","mentee123@test.com"
        log_in "TestMentee"
        click_link '> Get Help'
        expect(page).to have_content("test123")
        clear_db
    end
end