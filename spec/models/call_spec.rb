require 'rails_helper'

RSpec.describe Call, type: :model do
  before do
    @coach = Coach.new(name: "arnold")
    @coach.save!

    @schedule = Schedule.new()
    start = @schedule.generate_date_from_language(8,9)
    finish = @schedule.generate_date_from_language(8,11)
    @schedule.slot_start = start
    @schedule.slot_end = finish
    @schedule.coach = @coach
    @schedule.save!
  end

  it "can be added to a schedule" do
    @call = Call.new(score: 5, notes: "He was very attentive and caring")
    @schedule.call = @call
    @schedule.save!

    expect(@schedule).to be_valid
  end

  it "score cant cross boundary" do
    @call = Call.new(score: 0, notes: "He was very attentive and caring")
    @schedule.call = @call
    @schedule.save!

    expect(@schedule).not_to be_valid
  end
end
