class Coach < ApplicationRecord
    has_many :schedules
    has_many :students, through: :schedules

    validates :name, presence: true

    def upcoming_schedule
        #NOTE:I know i shouldnt reference another class here, but it's simpler than the associations
        #SELECT "schedules".* FROM "schedules" WHERE (coach_id = 3 AND slot_start > '2025-03-07 09:11:06.869444') /* loading for pp */ LIMIT $1  [["LIMIT", 11]] #Noooice
        Schedule.where("coach_id = ? AND slot_start > ?", self.id, DateTime.now)
    end

    def self.general_coach_availability
        all.each do | coach |
            coach.upcoming_schedule
        end
    end
end
