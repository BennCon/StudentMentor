require_relative "../../helpers/spec_helper"

RSpec.describe Mentee do
    describe "#load" do
        it "loads an mentee object with information about said mentee" do
            mentee = described_class.new(first_name: "A", surname: "B", course: "ABCD", year_of_study: 9999, email: "123@AB.CDE", password: "pass")
            expect(mentee.values).to eq({:first_name=>"A", :surname=>"B", :course=>"ABCD", :year_of_study=>9999, :email=>"123@AB.CDE", :password=>"pass"})
        end
    end
    
    describe "#self.id_exists?" do
        it "Checks if the mentee id exists" do
            Mentee.unrestrict_primary_key
            mentee = described_class.new(username: "user", first_name: "A", surname: "B", course: "ABCD", year_of_study: 9999, email: "testtest@test.test", password: "test1234", id:9999)
            mentee.save_changes
            expect(described_class.id_exists?(9999)).to eq(true)
            mentee.delete
        end
    end
    
    describe "#get_id" do
        it "Gets the mentee id" do
            Mentee.unrestrict_primary_key
            mentee = described_class.new(username: "user", first_name: "A", surname: "B", course: "ABCD", year_of_study: 9999, email: "testtest@test.test", password: "test1234", id:9999)
            mentee.save_changes
            expect(mentee.get_id).to eq(9999)
            mentee.delete
        end
    end
end