require 'date'
require 'time'

class Schedule < ApplicationRecord
  belongs_to :coach
  belongs_to :student, optional: true

  validates :slot_start, presence: true, uniqueness: true
  validates :slot_end, presence: true, uniqueness: true
  validate :time_end_not_greater_than_2_hours, on: :create

  def generate_date_from_language(day, start_time)
    raise "start time is invalid" if start_time > 12
    raise "start time is invalid" if start_time < 0
    raise "start time is invalid" if day < DateTime.current.day
    return DateTime.new(DateTime.current.year, DateTime.current.month, day, start_time, 0)    
  end

  def time_end_not_greater_than_2_hours
    time_diff = Time.parse(self.slot_end.to_s) - Time.parse(self.slot_start.to_s)
    if time_diff / 3600 > 2.0
      errors.add(:slot_end, "can't be greater than 2 hours")
    end
  end
end
