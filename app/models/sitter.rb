class Sitter < ApplicationRecord
  has_many :references
  has_many :availabilities

  def age 
    ((Time.zone.now - birthday.to_time) / 1.year.seconds).floor
  end

  def with_calc
      {
        **serializable_hash.symbolize_keys, 
        age: age,
        references: references
      }
  end

  def self.with_calc
    all.map do |s|
      s.with_calc
    end

  end
end
