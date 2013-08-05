require 'spec_helper'

describe Night do
    it "should accept a valid date" do
        Night.create(:start_date => 2.days.ago, :end_date => 1.days.ago)
    end

    it "should fail with out start date specified" do
        expect { Night.create!(:end_date => 1.days.ago) }.to raise_error(ActiveRecord::RecordInvalid)
    end
end
