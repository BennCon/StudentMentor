require_relative "../../helpers/spec_helper.rb"

describe "The edit profile system" do
    it "is able to alter a mentor's biography" do
        register_mentor "MentorFirst","Surname","TestMentor","Male","Aerospace","Aerospace","mentortest@test.com"
        log_in "TestMentor"
        click_button "accEdit"
        fill_in "biography", with: "Lorem Ipsum"
        click_button "save"
        # The new biography should show up on the account page, correctly signified
        expect(page).to have_content "Biography: Lorem Ipsum"
        clear_db
    end
end