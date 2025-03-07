require 'rails_helper'

RSpec.describe Coach, type: :model do
    it "creates a new coach" do
        coach = Coach.create(name: "Arnold")
        expect(coach.name).to eql("Arnold") 
    end

    it "does not save without a name" do
        coach = Coach.create(name: nil)
        expect(coach).to_not be_valid
    end

    context "creates a schedule" do
        before do
            @coach = Coach.create(name: "Arnold")
        end

        it "creates a slot" do
            @schedule = Schedule.new()
            time = @schedule.generate_date_from_language(8,9)
            time2 = @schedule.generate_date_from_language(8,11)
            @schedule.coach = @coach
            @schedule.slot_start = time
            @schedule.slot_end = time2
            @schedule.save!
            
            expect(@schedule).to be_valid
        end

        it "cannot create duplicate time slots" do
            @schedule = Schedule.new()
            time = @schedule.generate_date_from_language(8,9)
            time2 = @schedule.generate_date_from_language(8,11)
            @schedule.coach = @coach
            @schedule.slot_start = time
            @schedule.slot_end = time2
            @schedule.save!

            @schedule0 = Schedule.new()
            @schedule0.coach = @coach
            @schedule0.slot_start = time
            @schedule0.slot_end = time2
            @schedule0.save!

            expect(@schedule0).not_to be_valid
        end

        it "time slot can't be greater than 2 hours" do
            @schedule = Schedule.new()
            time = @schedule.generate_date_from_language(8,9)
            time2 = @schedule.generate_date_from_language(8,12)
            @schedule.coach = @coach
            @schedule.slot_start = time
            @schedule.slot_end = time2
            @schedule.save!
            
            @schedule.valid?
            @schedule.errors.full_messages.should include("Slot end can't be greater than 2 hours")
            expect(@schedule).to raise_error
        end
    end
end
