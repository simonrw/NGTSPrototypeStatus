require 'spec_helper'

describe "Actions" do
  describe "GET /actions" do
      before(:each) do
          @date = 2.days.ago
          n = Night.create(:start_date => @date)
          n.actions.create(:action_id => 100)
          n.save
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
  end
end
