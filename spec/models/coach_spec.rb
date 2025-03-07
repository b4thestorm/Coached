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
end
