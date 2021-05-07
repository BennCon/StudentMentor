require_relative "../../helpers/spec_helper.rb"

describe "An admin email" do
    it "is available on the help page so that users can change their password" do
        register_mentee "MenteeFirst","MenteeSur","TestMentee","Male","mentee123@test.com"
        log_in "TestMentee"
        click_link '> Get Help'
        expect(page).to have_content("email")
        clear_db
    end
end