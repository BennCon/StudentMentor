require_relative "../../helpers/spec_helper"

RSpec.describe Mentee do
    describe "#load" do
        it "loads an mentee object with information about said mentee" do
            mentee = described_class.new(first_name: "A", surname: "B", course: "ABCD", year_of_study: 9999, email: "123@AB.CDE", password: "pass")
            expect(mentee.values).to eq({:first_name=>"A", :surname=>"B", :course=>"ABCD", :year_of_study=>9999, :email=>"123@AB.CDE", :password=>"pass"})
        end
    end
end