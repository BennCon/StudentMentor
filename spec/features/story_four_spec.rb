require_relative "../../helpers/spec_helper.rb"

describe "The Filter System" do
    
    it "Filters by gender" do
        register_mentor "Mister","Planes","planes123","Male","Aerospace","Aerospace","planes123@test.com"
        register_mentor "Miss","Plants","plants123","Female","Agriculture","Agriculture","plants123@test.com"
        
        register_log_in_mentee
        click_link '> Find A Mentor'
        click_button "Filters"
        choose "Male"
        click_button "Apply filters"
        expect(page).to have_content "Mister"
        expect(page).not_to have_content "Miss"
    end
    
    it "Filters by industry" do
        register_log_in_mentee
        click_link '> Find A Mentor'
        click_button "Filters"
        select "Agriculture", from: "industry"
        click_button "Apply filters"
        expect(page).not_to have_content "Mister"
        expect(page).to have_content "Miss"
    end
    
    it "Filters by degree field" do
        register_log_in_mentee
        click_link '> Find A Mentor'
        click_button "Filters"
        select "Aerospace", from: "degree_field"
        click_button "Apply filters"
        expect(page).to have_content "Mister"
        expect(page).not_to have_content "Miss"
        clear_db
    end
end