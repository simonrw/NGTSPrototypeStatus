require "spec_helper"

describe "observations index" do
    before(:each) do 
        @observation = Observation.create(:observation_number => 10101)
        visit observations_path
    end

    it "should have a list of observations" do
        expect(page).to have_content "10101"
    end

    it "should show a 'More detail' link" do
        expect(page).to have_content "More detail"
    end

    it "should go to the observation detail when 'More detail' clicked" do
        click_link "More detail"
        expect(current_path).to eq(observation_path(@observation))
    end
end

describe "Observation detail" do
    before(:each) do
        @observation = Observation.create(:observation_number => 10101)
        visit observation_path(@observation)
    end

    it "should have the observation id visible" do
        expect(page).to have_content @observation.observation_number
    end
end
