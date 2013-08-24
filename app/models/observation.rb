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

class Observation < ActiveRecord::Base
    belongs_to :night
    has_many :measurements, :dependent => :destroy
    accepts_nested_attributes_for :measurements, :night
    validates_presence_of :observation_number
end
