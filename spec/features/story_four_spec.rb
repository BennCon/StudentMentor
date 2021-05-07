require_relative "../../helpers/spec_helper.rb"

describe "The Filter System" do
    
    it "shows all available mentors when no filter is selected" do
        register_mentor "Mister","Planes","planes123","Male","Aerospace","Aerospace","planes123@test.com"
        register_mentor "Miss","Plants","plants123","Female","Agriculture","Agriculture","plants123@test.com"
        
        register_mentee "MenteeFirst","MenteeSur","TestMentee","Male","mentee123@test.com"
        log_in "TestMentee"
        click_link '> Find A Mentor'
        expect(page).to have_content "Mister"
        expect(page).to have_content "Miss"
    end
    
    it "filters by gender" do
        log_in "TestMentee"
        click_link '> Find A Mentor'
        click_button "Filters"
        choose "Male"
        click_button "Apply filters"
        expect(page).to have_content "Mister"
        expect(page).not_to have_content "Miss"
    end
    
    it "filters by industry" do
        log_in "TestMentee"
        click_link '> Find A Mentor'
        click_button "Filters"
        select "Agriculture", from: "industry"
        click_button "Apply filters"
        expect(page).not_to have_content "Mister"
        expect(page).to have_content "Miss"
    end
    
    it "filters by degree field" do
        log_in "TestMentee"
        click_link '> Find A Mentor'
        click_button "Filters"
        select "Aerospace", from: "degree_field"
        click_button "Apply filters"
        expect(page).to have_content "Mister"
        expect(page).not_to have_content "Miss"
    end
    
    it "displays a message if no mentors are available with the specified filters" do
        log_in "TestMentee"
        click_link '> Find A Mentor'
        click_button "Filters"
        select "Tourism", from: "industry"
        click_button "Apply filters"
        expect(page).not_to have_content "Mister"
        expect(page).not_to have_content "Miss"
        expect(page).to have_content "no Mentors"
        clear_db
    end
end