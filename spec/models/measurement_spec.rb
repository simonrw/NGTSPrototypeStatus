require 'spec_helper'

describe Measurement do
    before(:each) do
        @m = Measurement.new
        @action = double("action", :measurements => [@m])
        @night = double("night", :actions => [@action])
    end

    it "should have the correct attributes" do
        attrs = [:mjd, :action_id, :sky_background, :humidity, :ambient_temp, :ccd_temp, :fwhm]
        attrs.each do |attr|
            expect(@m).to have_attribute attr
        end
    end
end
