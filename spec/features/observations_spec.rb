require "spec_helper"

describe "observations index" do
    before(:each) do 
        @observation = Observation.create(:observation_number => 10101)
        User.new({ :email => "test@example.com", :password => "pass", :password_confirmation => "pass" }).save(:validate => false)
        @user = User.first
        visit observations_path
        fill_in "Email", :with => @user.email
        fill_in "Password", :with => "pass"
        click_on "Sign in"
    end

    it "should have a list of observations" do
        expect(page).to have_content @observation.observation_number
    end

    it "should show a 'More detail' link" do
        expect(page).to have_content "More detail"
    end

    it "should go to the observation detail when 'More detail' clicked" do
        click_link "More detail"
        expect(current_path).to eq(observation_path(@observation))
    end

    it "should have delete links" do
        expect(page).to have_content "Delete observation"
    end

    it "should delete the observations when the link is clicked" do
        click_link "Delete observation"
        expect(page).to have_content "Observation removed"
    end
end

describe "Observation detail" do
    before(:each) do
        @observation = Observation.create(:observation_number => 10101)
        User.new({ :email => "test@example.com", :password => "pass", :password_confirmation => "pass" }).save(:validate => false)
        @user = User.first
        visit observation_path(@observation)
        fill_in "Email", :with => @user.email
        fill_in "Password", :with => "pass"
        click_on "Sign in"
    end

    it "should have the observation id visible" do
        expect(page).to have_content @observation.observation_number
    end

    it "should have a link to the measurements" do
        expect(page).to have_content "Show measurements"
    end

    it "should go to the measurements list when 'Show measurement' is clicked" do
        click_link "Show measurements"
        expect(current_path).to eq(
            observation_measurements_path(@observation)
        )
    end
end
