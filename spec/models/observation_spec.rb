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
  pending "add some examples to (or delete) #{__FILE__}"
end
