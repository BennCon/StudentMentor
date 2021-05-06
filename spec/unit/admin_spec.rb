require_relative "../../helpers/spec_helper"

RSpec.describe Admin do
    describe "#load" do
        it "loads an admin object with information about said admin" do
            admin = described_class.new(first_name: "A", surname: "B", admin_code: "1234", email: "123@AB.CDE", password: "test1234", username:"user")
            admin.save_changes
            expect(admin.values).to eq({:id=>1, :first_name=>"A", :surname=>"B", :admin_code=>"1234", :email=>"123@AB.CDE", :password=>"test1234", :username=>"user"})
            admin.delete
        end
    end
    
    describe "#self.id_exists?" do
        it "Checks if the admins id exists" do
            admin = described_class.new(username: "user", first_name: "A", surname: "B", admin_code: "1234", email: "testtest@test.test", password: "test1234")
            admin.save_changes
            expect(Admin.id_exists?(1)).to eq(true)
            admin.delete
        end
    end
    
    describe "#get_id" do
        it "Gets the admin id" do
            admin = described_class.new(username: "user", first_name: "A", surname: "B", admin_code: "1234", email: "testtest@test.test", password: "test1234")
            admin.save_changes
            expect(admin.get_id).to eq(1)
            admin.delete
        end
    end
end