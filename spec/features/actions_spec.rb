require 'spec_helper'

describe "Actions" do
  describe "GET /actions" do
      before(:each) do
          @date = 3.days.ago
          @night = Night.create(:start_date => @date,
                                :end_date => @date + 1)
          @action = @night.actions.create(:action_id => 100)
          @night.save
          visit actions_path
      end

      it "should show a list of actions" do
          expect(page).to have_content '100'
      end

      it "should have a link for the corresponding night" do
          expect(page).to have_content 'View night'
          click_link 'View night'
          expect(page).to have_content @date
      end

      it "should have a link for the measurements in detail" do
          expect(page).to have_content 'View measurements'
          click_link 'View measurements'
          expect(page).to have_content "Measurements for Action #{@action.action_id}"
      end
  end
end
