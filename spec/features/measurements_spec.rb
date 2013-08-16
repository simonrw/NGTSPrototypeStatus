require "spec_helper"

describe "measurements index" do
    before(:each) do
        @observation = Observation.create(
            :observation_number => 10101
        )
        basic_auth
        visit observation_measurements_path(@observation)
    end

    it "should show the observation number" do
        expect(page).to have_content "Measurements for Observation #{@observation.observation_number}"
    end
end
