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
end
