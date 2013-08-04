require 'spec_helper'

describe Action do
    it "should have an action id" do
        expect(Action.new).to have_attribute(:action_id)
    end

    it "should have a night id" do
        expect(Action.new).to have_attribute(:night_id)
    end
end
