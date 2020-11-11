class MinPeriod < ActiveModel::Validator
  def validate(record)
    if record.end_time && record.start_time && (record.end_time - record.start_time) / 60 < 60
      record.errors.add :period, "Must be minimum one hour."
    end
  end
end


class Availability < ApplicationRecord
  belongs_to :sitter

  validates :weekday, inclusion: {in: 0..6, message: "Must be an int from zero to six"}
  validates :start_time, :end_time, presence: true
  validates_with MinPeriod
end
