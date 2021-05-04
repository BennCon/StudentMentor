require_relative "../../helpers/spec_helper"

RSpec.describe Mentor do
    describe "#load" do
        it "loads an mentor object with information about said mentor" do
            mentor = described_class.new(first_name: "A", surname: "B", industry: "ABCDE", company:"ABCDE", email: "123@AB.CDE", password: "pass", sheffield_graduate: true, degree_field: "ABCDE")
            expect(mentor.values).to eq({:first_name=>"A", :surname=>"B", :industry=>"ABCDE", :company=>"ABCDE", :email=>"123@AB.CDE", :password=>"pass", :sheffield_graduate=>true, :degree_field=>"ABCDE"})
        end
    end
    
    describe "#self.id_exists?" do
        it "Checks if the mentor id exists" do
            Mentor.unrestrict_primary_key
            mentor = described_class.new(first_name: "A", username: "user", surname: "B", industry: "ABCDEF", company:"ABCDE", email: "testtest@test.test", password: "test1234", sheffield_graduate: true, degree_field: "ABCD")
            mentor.save_changes
            expect(Mentor.id_exists?(1)).to eq(true)
            mentor.delete
        end
    end
    
    describe "#get_id" do
        it "Gets the mentor id" do
            Mentor.unrestrict_primary_key
            mentor = described_class.new(first_name: "A", username: "user", surname: "B", industry: "ABCDEF", company:"ABCDE", email: "testtest@test.test", password: "test1234", sheffield_graduate: true, degree_field: "ABCD")
            mentor.save_changes
            expect(mentor.get_id).to eq(1)
            mentor.delete
        end
    end
end