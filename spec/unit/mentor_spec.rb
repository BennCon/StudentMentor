require_relative "../../helpers/spec_helper"

RSpec.describe Mentor do
    describe "#load" do
        it "loads an mentor object with information about said mentor" do
            mentor = described_class.new(seeking_mentee: 1, number_of_mentees: 0, gender:"male", biography:"I am from sheffield", username: "user", first_name: "A", surname: "B", industry: "ABCDE", company:"ABCDE", email: "123@AB.CDE", password: "pass1234", sheffield_graduate: 1, degree_field: "ABCDE")
            mentor.save_changes
            expect(mentor.values).to eq({:seeking_mentee=>1,:number_of_mentees=>0, :id=>1, :gender=>"male", :biography=>"I am from sheffield", :username=>"user", :first_name=>"A", :surname=>"B", :industry=>"ABCDE", :company=>"ABCDE", :email=>"123@AB.CDE", :password=>"pass1234", :sheffield_graduate=>1, :degree_field=>"ABCDE"})
            mentor.delete
        end
    end
    
    describe "#self.id_exists?" do
        it "Checks if the mentor id exists" do
            mentor = described_class.new(seeking_mentee: 1, number_of_mentees: 0, gender:"male", biography:"I am from sheffield", username: "user", first_name: "A", surname: "B", industry: "ABCDE", company:"ABCDE", email: "123@AB.CDE", password: "pass1234", sheffield_graduate: 1, degree_field: "ABCDE")
            mentor.save_changes
            expect(Mentor.id_exists?(1)).to eq(true)
            mentor.delete
        end
    end
    
    describe "#get_id" do
        it "Gets the mentor id" do
            Mentor.unrestrict_primary_key
            mentor = described_class.new(seeking_mentee: 1, number_of_mentees: 0, gender:"male", biography:"I am from sheffield", username: "user", first_name: "A", surname: "B", industry: "ABCDE", company:"ABCDE", email: "123@AB.CDE", password: "pass1234", sheffield_graduate: 1, degree_field: "ABCDE")
            mentor.save_changes
            expect(mentor.get_id).to eq(1)
            mentor.delete
        end
    end
end