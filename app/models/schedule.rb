require 'date'

class Schedule < ApplicationRecord
  belongs_to :coach
  belongs_to :student, optional: true

  validates :slot, presence: true, uniqueness: true

  def generate_date_from_language(day, start_time)
    raise "start time is invalid" if start_time > 12
    raise "start time is invalid" if start_time < 0
    raise "start time is invalid" if day < DateTime.current.day
    return DateTime.new(DateTime.current.year, DateTime.current.month, day, start_time, 0)    
  end


end
