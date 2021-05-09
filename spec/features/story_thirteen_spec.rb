require_relative "../../helpers/spec_helper.rb"

describe "An admin" do
    it "can view a mentees request count" do
        Code.unrestrict_primary_key
        code = Code.new(id: 55, code: "codetest", used: 0)
        code.save_changes
        register_admin "TestAdmin","testcode","admintest@test.com"
        register_mentee "MenteeFirst","MenteeSur","TestMentee","Male","1st","mentee123@test.com"
        log_in "TestAdmin"
        click_link '> All Mentees'
        # The request count should intially be 0 for a new mentee account
        expect(page).to have_content(" 0 ")
    end
    it "can see an updated request count after the mentee makes more requests" do
        #Make the mentee account contact a mentor when system is in place, then get admin to check
    end
    it "can ban a mentee" do
        #Make admin ban a mentee, then check that the mentee cannot log in
        clear_db
    end
end