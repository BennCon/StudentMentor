require_relative "../../helpers/spec_helper"

RSpec.describe Admin do
    describe "#load" do
        it "loads an admin object with information about said admin" do
            admin = described_class.new(first_name: "A", surname: "B", admin_code: "1234", email: "123@AB.CDE", password: "pass")
            expect(admin.values).to eq({:first_name=>"A", :surname=>"B", :admin_code=>"1234", :email=>"123@AB.CDE", :password=>"pass"})
        end
    end
end