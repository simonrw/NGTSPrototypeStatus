class Night < ActiveRecord::Base
    has_many :actions

    validates :start_date, :presence => true
    validates :end_date, :presence => true
end
