# == Schema Information
#
# Table name: observations
#
#  id                 :integer          not null, primary key
#  observation_number :integer
#  night_id           :integer
#  log                :text
#  created_at         :datetime
#  updated_at         :datetime
#

require 'spec_helper'

describe Observation do
    it "should have an observation_number" do
        expect(Observation.new).to have_attribute(:observation_number)
    end

    it "should have a collection of measurements" do
        o = Observation.create
        o.measurements.create
        o.measurements.create
        expect(o.measurements.length).to eq(2)
    end

    it "should fail to save without an observation number" do
        expect{ Observation.create! }.to raise_error
    end
end
