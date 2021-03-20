require_relative "../../helpers/spec_helper.rb"

describe "The sign up pages" do
    it "Can create mentee accounts" do
        register_log_in_mentee
        expect(page).to have_content "MenteeFirst"
    end
        
    it "Can create mentor accounts" do
        register_log_in_mentor
        expect(page).to have_content "MentorFirst"
    end
end