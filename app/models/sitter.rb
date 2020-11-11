class Sitter < ApplicationRecord
  has_many :references
  has_many :availabilities


  ## INSTANCE METHODS
  
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


  ## CLASS METHODS

  def self.find_by_availabilities(params)
    day = Date.parse(params["day"]).cwday

    query_text = %{
    availabilities.weekday = ? AND
    availabilities.start_time <= ? AND
    availabilities.end_time >= ?
    }
    joins(:availabilities).where(query_text, day, params["from"], params["to"])
  end

  def self.with_calc
    all.map do |s|
      s.with_calc
    end
  end

end
