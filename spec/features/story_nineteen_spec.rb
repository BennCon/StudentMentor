require_relative "../../helpers/spec_helper.rb"

describe "The help page" do
    it "is accessible to mentees" do
        register_mentee "MenteeFirst","MenteeSur","TestMentee","Male","mentee123@test.com"
        log_in "TestMentee"
        click_link "> Get Help"
        expect(page).to have_content "email"
        clear_db
    end
end