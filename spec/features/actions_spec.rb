require 'spec_helper'

describe "Actions" do
  describe "GET /actions" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit actions_path
      expect(response.status).to be(200)
    end
  end
end
