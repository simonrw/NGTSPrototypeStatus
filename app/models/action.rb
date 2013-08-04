class Action < ActiveRecord::Base
    belongs_to :night
    has_many :measurements
end
