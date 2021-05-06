require_relative "../../helpers/spec_helper"

RSpec.describe Questions_answers do
    describe "#load" do
        it "loads an faq object with faq information" do
            faq = described_class.new(question: "How do you do x?", answer: "You have to do Y.", user_type: "mentee")
            faq.save_changes
            expect(faq.values).to eq({:id=>1, :question=>"How do you do x?", :answer=>"You have to do Y.", :user_type=>"mentee"})
            faq.delete
        end
    end
end