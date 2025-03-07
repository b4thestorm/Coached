class Coach < ApplicationRecord
    has_many :schedules
    has_many :students, through: :schedules
    
    validates :name, presence: true
end
