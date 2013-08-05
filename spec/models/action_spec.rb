# == Schema Information
#
# Table name: actions
#
#  id         :integer          not null, primary key
#  action_id  :integer
#  night_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Action do
    it "should have an action id" do
        expect(Action.new).to have_attribute(:action_id)
    end

    it "should have a night id" do
        expect(Action.new).to have_attribute(:night_id)
    end

    it "should validate the action id" do
        expect { Action.create! }.to raise_error(ActiveRecord::RecordInvalid)
    end

end
