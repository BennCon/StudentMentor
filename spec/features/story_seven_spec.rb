require_relative "../../helpers/spec_helper.rb"

describe "The splash page gives the option to" do
    
    it "sign up as a mentee" do
        visit "/"
        click_link('sign up as a mentee')
        expect(page).to have_content "Signing up"
        expect(page).to have_content "MENTEE"
    end
    
    it "sign up as a mentor" do
        visit "/"
        click_link('sign up as a mentor')
        expect(page).to have_content "Signing up"
        expect(page).to have_content "MENTOR"
    end
    
    it "sign up as an admin" do
        visit "/"
        click_link('sign up as an admin')
        expect(page).to have_content "Signing up"
        expect(page).to have_content "ADMIN"
    end
end