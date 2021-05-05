require_relative "../../helpers/spec_helper"

RSpec.describe Admin do
    describe "#load" do
        it "loads an admin object with information about said admin" do
            admin = described_class.new(first_name: "A", surname: "B", admin_code: "1234", email: "123@AB.CDE", password: "test1234", username:"user")
            admin.save_changes
            expect(admin.values).to eq({:first_name=>"A", :surname=>"B", :admin_code=>"1234", :email=>"123@AB.CDE", :password=>"test1234", :username=>"user"})
            admin.delete
        end
    end
    
    describe "#self.id_exists?" do
        it "Checks if the admins id exists" do
            Admin.unrestrict_primary_key
            admin = described_class.new(id:1234, username: "user", first_name: "A", surname: "B", admin_code: "1234", email: "testtest@test.test", password: "test1234")
            admin.save_changes
            expect(Admin.id_exists?(1234)).to eq(true)
            admin.delete
        end
    end
    
    describe "#get_id" do
        it "Gets the admin id" do
            Admin.unrestrict_primary_key
            admin = described_class.new(id:1234, username: "user", first_name: "A", surname: "B", admin_code: "1234", email: "testtest@test.test", password: "test1234")
            admin.save_changes
            expect(admin.get_id).to eq(1234)
            admin.delete
        end
    end
end