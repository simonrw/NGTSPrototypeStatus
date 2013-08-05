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

class Night < ActiveRecord::Base
    has_many :actions

    validates :start_date, :presence => true
    validates :end_date, :presence => true

    validates :start_date, :inclusion => (Date.new(2011, 1, 1)..Date.today)
end
