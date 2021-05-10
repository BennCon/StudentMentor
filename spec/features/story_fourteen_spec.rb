require_relative "../../helpers/spec_helper.rb"

describe "A mentee" do
    it "is able to change their email" do
        register_mentee "MenteeFirst","MenteeSur","TestMentee","Male","1st","mentee123@test.com"
        log_in "TestMentee"
        click_button "accEdit"
        fill_in "email", with: "newmenteetest@test.com"
        click_button "save"
        # Need to check that the 'email' field of the description has updated on the page
        expect(page).to have_content "Email: newmenteetest@test.com"
        clear_db
    end
end