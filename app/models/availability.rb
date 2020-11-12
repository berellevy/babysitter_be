class Availability < ApplicationRecord
  belongs_to :sitter
  
  # TODO: validate uniqueness of all fields together
  validates :weekday, inclusion: {in: 0..6, message: "Must be an int from zero to six"}
  validates :start_time, presence: true
end
