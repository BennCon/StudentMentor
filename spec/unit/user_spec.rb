require_relative "../../helpers/spec_helper"

RSpec.describe User do
    describe "#load" do
        it "loads an user object with information about said mentor" do
            user = described_class.new(email: "123@AB.CDE", password: "pass")
            expect(user.values).to eq({:email=>"123@AB.CDE", :password=>"pass"})
        end
    end
end