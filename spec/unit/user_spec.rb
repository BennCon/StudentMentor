require_relative "../../helpers/spec_helper"

RSpec.describe User do
    describe "#load" do
        it "loads an user object with information about said mentor" do
            user = described_class.new(email: "123@AB.CDE", password: "pass")
            expect(user.values).to eq({:email=>"123@AB.CDE", :password=>"pass"})
        end
    end
    
    describe "#exist?" do
        it "Checks if the user exists" do
            user = described_class.new(email: "123@AB.CDE", password: "pass")
            user.save_changes
            expect(user.exist?).to eq(true)
            user.delete
        end
    end
    
    describe "#get_type" do
        it "Gets the type of user" do
            user = described_class.new(email: "123@AB.CDE", password: "pass", user_type:"admin")
            user.save_changes
            expect(user.get_type).to eq("admin")
            user.delete
        end
    end
end