# == Schema Information
#
# Table name: nights
#
#  id         :integer          not null, primary key
#  start_date :datetime
#  end_date   :datetime
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Night do
    it "should accept a valid date" do
        Night.create(:start_date => 2.days.ago, :end_date => 1.days.ago)
    end

    it "should fail with out start date specified" do
        expect { Night.create!(:end_date => 1.days.ago) }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "should fail to save if the start date is outside the range 2011->now" do
        expect { Night.create!(:start_date => Date.new(2000, 1, 1), :end_date => 2.days.ago) }.to raise_error(ActiveRecord::RecordInvalid)
    end
end
