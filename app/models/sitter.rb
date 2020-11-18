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
        age: age
      }
  end

  def with_relations
    {
      **with_calc, 
      references: references,
      availabilities: availabilities,
      appointments: appointments
    }
  end


  ## CLASS METHODS

    def self.find_by_availabilities(params)
      day, start_time, duration = params.values_at("day", "startTime", "duration")

      weekday = Date.parse(day).cwday
      puts "weekday", weekday

      join_clause = <<-SQL 
        INNER JOIN (
          SELECT 
            availabilities.*, 
            (EXTRACT(epoch FROM \'#{start_time}\' - availabilities.start_time) / 60) AS query_start_minus_record_start,  
            (\'#{duration}\' - availabilities.duration_minutes) AS query_duration_minus_record_duration   
            FROM "availabilities"
          ) AS a
        ON sitters.id = a.sitter_id
      SQL

      where_clause = <<-SQL
          weekday = #{weekday} AND
          a.query_start_minus_record_start >= 0 AND
          a.query_duration_minus_record_duration <= 0 AND
          a.query_start_minus_record_start + a.query_duration_minus_record_duration <= 0
      SQL

    joins(join_clause).where(where_clause).group("sitters.id")
  end

  def self.with_calc
    all.map do |s|
      s.with_calc
    end
  end

end
