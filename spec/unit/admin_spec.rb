require_relative "../../helpers/spec_helper"

RSpec.describe Admin do
    describe "#load" do
        it "loads an admin object with information about said admin" do
            admin = described_class.new(first_name: "A", surname: "B", admin_code: "1234", email: "123@AB.CDE", password: "pass")
            expect(admin.values).to eq({:first_name=>"A", :surname=>"B", :admin_code=>"1234", :email=>"123@AB.CDE", :password=>"pass"})
        end
    end
    
    describe "#self.id_exists?" do
        it "Checks if the admins id exists" do
            Admin.unrestrict_primary_key
            admin = described_class.new(id: 9127478917489)
            admin.save_changes
            expect(Admin.id_exists?(9127478917489)).to eq(true)
            admin.delete
        end
    end
    
    describe "#get_id" do
        it "Gets the admin id" do
            Admin.unrestrict_primary_key
            admin = described_class.new(id: 9127478917489)
            admin.save_changes
            expect(admin.get_id).to eq(9127478917489)
            admin.delete
        end
    end
end