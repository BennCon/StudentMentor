require_relative "../../helpers/spec_helper.rb"

describe "An admin" do
    
    it "can register with a correct code" do
        Code.unrestrict_primary_key
        code = Code.new(id: 75, code: "something123", used: 0)
        code.save_changes
        # Create a new code and check that it works
        register_admin "admin1","something123","admin1@test.com"
        expect(page).to have_content "sign in"
    end
    
    it "cannot register with an in-use code" do
        # Try to make a new account with the same code, it shouldn't work
        register_admin "admin2","something123","admin2test@test.com"
        expect(page).not_to have_content "sign in"
    end
    
    it "cannot register with an incorrect code" do
        # Try to make a new account with a non-existant code, it shouldn't work
        register_admin "admin3","different","admin3test@test.com"
        expect(page).not_to have_content "sign in"
        clear_db
    end
end