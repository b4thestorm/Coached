class Student < ApplicationRecord
    has_many :schedules
    has_many :coaches, through: :schedules


end
