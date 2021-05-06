require_relative "../../helpers/spec_helper"

RSpec.describe Mentee do
    describe "#load" do
        it "loads an mentee object with information about said mentee" do
            mentee = described_class.new(university:"University of Sheffield", number_of_rejections: 2, mentor_id: 1, has_mentor: 1, has_contacted: 1, gender: "male", biography: "I enjoy football", username: "user", first_name: "A", surname: "B", course: "ABCD", year_of_study: 9999, email: "123@AB.CDE", password: "pass1234")
            mentee.save_changes
            expect(mentee.values).to eq({:university=>"University of Sheffield",:number_of_rejections=> 2, :mentor_id=>1, :has_mentor=>1, :has_contacted=>1, :gender=>"male", :biography=>"I enjoy football", :id=>1, :username=>"user", :first_name=>"A", :surname=>"B", :course=>"ABCD", :year_of_study=>9999, :email=>"123@AB.CDE", :password=>"pass1234"})
            mentee.delete
        end
    end
    
    describe "#self.id_exists?" do
        it "Checks if the mentee id exists" do
            mentee = described_class.new(university:"University of Sheffield", number_of_rejections: 2, mentor_id: 1, has_mentor: 1, has_contacted: 1, gender: "male", biography: "I enjoy football", username: "user", first_name: "A", surname: "B", course: "ABCD", year_of_study: 9999, email: "123@AB.CDE", password: "pass1234")
            mentee.save_changes
            expect(described_class.id_exists?(1)).to eq(true)
            mentee.delete
        end
    end
    
    describe "#get_id" do
        it "Gets the mentee id" do
            Mentee.unrestrict_primary_key
            mentee = described_class.new(university:"University of Sheffield", number_of_rejections: 2, mentor_id: 1, has_mentor: 1, has_contacted: 1, gender: "male", biography: "I enjoy football", username: "user", first_name: "A", surname: "B", course: "ABCD", year_of_study: 9999, email: "123@AB.CDE", password: "pass1234")
            mentee.save_changes
            expect(mentee.get_id).to eq(1)
            mentee.delete
        end
    end
end