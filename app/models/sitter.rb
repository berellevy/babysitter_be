class Sitter < ApplicationRecord
  has_many :references
  has_many :availabilities
  has_many :appointments


  ## INSTANCE METHODS
  
  def age 
    ((Time.zone.now - birthday.to_time) / 1.year.seconds).floor
  end

  def with_calc
      {
        **serializable_hash.symbolize_keys, 
        age: age,
        references: references,
        availabilities: availabilities
      }
  end


  ## CLASS METHODS

  def self.find_by_availabilities(params)
    day, from, to = params.values_at("day", "from", "to")
    day = Date.parse(params["day"]).cwday

    query_text = %{
    sitters.available = true AND
    availabilities.weekday = ? AND
    availabilities.start_time <= ? AND
    availabilities.end_time >= ?
    }
    group = "sitters.id"
    select = "sitters.*"
    joins(:availabilities).where(query_text, day, from, to).group(group).select(select)
  end

  def self.with_calc
    all.map do |s|
      s.with_calc
    end
  end

end
