require_relative "../../helpers/spec_helper"

RSpec.describe Mentor do
    describe "#load" do
        it "loads an mentor object with information about said mentor" do
            mentor = described_class.new(first_name: "A", surname: "B", industry: "ABCDE", company:"ABCDE", email: "123@AB.CDE", password: "pass")
            expect(mentor.values).to eq({:first_name=>"A", :surname=>"B", :industry=>"ABCDE", :company=>"ABCDE", :email=>"123@AB.CDE", :password=>"pass"})
        end
    end
end