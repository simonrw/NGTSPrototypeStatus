require "spec_helper"

describe "observations index" do
    before(:each) do 
        @observation = Observation.create(:observation_number => 10101)
    end

    it "should have a list of observations" do
        visit observations_path
        expect(page).to have_content "10101"
    end
end
