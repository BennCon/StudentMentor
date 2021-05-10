require_relative "../../helpers/spec_helper.rb"

describe "The edit profile system" do
    it "is able to alter a mentee's details" do
        register_mentee "MenteeFirst","MenteeSur","TestMentee","Male","1st","mentee123@test.com"
        log_in "TestMentee"
        click_button "accEdit"
        fill_in "biography", with: "Lorem Ipsum"
        click_button "save"
        # The new biography should show up on the account page, correctly signified
        expect(page).to have_content "Biography: Lorem Ipsum"
        clear_db
    end
end