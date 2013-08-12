require "spec_helper"

describe "measurements index" do
    before(:each) do
        @observation = Observation.create(
            :observation_number => 10101
        )
        User.new({ :email => "test@example.com", :password => "pass", :password_confirmation => "pass" }).save(:validate => false)
        @user = User.first
        visit observation_measurements_path(@observation)
        fill_in "Email", :with => @user.email
        fill_in "Password", :with => "pass"
        click_on "Sign in"
    end

    it "should show the observation number" do
        expect(page).to have_content "Measurements for Observation #{@observation.observation_number}"
    end
end
