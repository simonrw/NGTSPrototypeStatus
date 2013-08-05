# == Schema Information
#
# Table name: measurements
#
#  id             :integer          not null, primary key
#  action_id      :integer
#  mjd            :float
#  sky_background :float
#  humidity       :float
#  ambient_temp   :float
#  ccd_temp       :float
#  fwhm           :float
#  created_at     :datetime
#  updated_at     :datetime
#

class Measurement < ActiveRecord::Base
    belongs_to :observation
end
