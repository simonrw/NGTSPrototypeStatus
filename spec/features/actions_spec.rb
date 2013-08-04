require 'spec_helper'

describe "Actions" do
  describe "GET /actions" do
    it "should show a list of actions" do

        Action.create(:action_id => 100)


      visit actions_path
      expect(page).to have_content '100'
    end
  end
end
