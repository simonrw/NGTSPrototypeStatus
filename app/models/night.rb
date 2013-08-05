class Night < ActiveRecord::Base
    has_many :actions

    validates :start_date, :presence => true
    validates :end_date, :presence => true

    validates :start_date, :inclusion => (Date.new(2011, 1, 1)..Date.new)
end
