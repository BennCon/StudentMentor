require_relative "../../helpers/spec_helper.rb"

describe "The edit profile system" do
    it "Is able to alter a mentor's biography" do
        register_log_in_mentor
        click_button "accEdit"
        fill_in "biography", with: "Lorem Ipsum"
        click_button "save"
        expect(page).to have_content "Biography: Lorem Ipsum"
    end
end