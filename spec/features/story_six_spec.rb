require_relative "../../helpers/spec_helper.rb"

describe "An admin" do
    
    it "can register with a correct code" do
        Code.unrestrict_primary_key
        code = Code.new(id: 75, code: "something123", used: 0)
        code.save_changes
        register_admin "admin1","something123","admin1@test.com"
        expect(page).to have_content "sign in"
    end
    
    it "cannot register with an in-use code" do
        register_admin "admin2","something123","admin2test@test.com"
        expect(page).not_to have_content "sign in"
    end
    
    it "cannot register with an incorrect code" do
        register_admin "admin3","different","admin3test@test.com"
        expect(page).not_to have_content "sign in"
        clear_db
    end
end