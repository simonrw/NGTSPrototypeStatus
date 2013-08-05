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

class Action < ActiveRecord::Base
    belongs_to :night
    has_many :measurements

    validates :action_id, presence: true, 
        :numericality => { :only_integer => true, :greater_than => 0 }
end
