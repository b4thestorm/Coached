class Call < ApplicationRecord
  belongs_to :schedule

  validate :score_boundary
  
  def score_boundary
    if score > 5 or score < 1
      errors.add(:score, "out of range [1..5]")
    end
  end
end
