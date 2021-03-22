require_relative "../../helpers/spec_helper.rb"

describe "The help page" do
    it "is accessible to mentees" do
        register_log_in_mentee
        click_link "> Get Help"
        expect(page).to have_content "email"
        clear_db
    end
end