class Sitter < ApplicationRecord
  has_many :references
  has_many :availabilities

  def age 
    ((Time.zone.now - birthday.to_time) / 1.year.seconds).floor
  end

  def with_calc
    obj = serializable_hash.symbolize_keys
      {
        **obj, 
        age: age
      }
  end

  def self.with_calc
    all.map do |s|
      s.with_calc
    end

  end
end
