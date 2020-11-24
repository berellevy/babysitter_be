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

    def self.find_available(params)
      day, start_time, duration = params.values_at("day", "startTime", "duration")
      start_date = DateTime.parse(day + " " + start_time)
      end_date = start_date + duration.to_i.minutes
      weekday = Date.parse(day).cwday

      av_join = <<-SQL 
        INNER JOIN (
          SELECT 
            availabilities.*, 
            (EXTRACT(epoch FROM \'#{start_time}\' - availabilities.start_time) / 60) AS query_start_minus_record_start,  
            (\'#{duration}\' - availabilities.duration_minutes) AS query_duration_minus_record_duration   
            FROM "availabilities"
          ) AS av
        ON sitters.id = av.sitter_id
      SQL

      ap_join = <<-SQL 
        INNER JOIN (
          SELECT 
		        *,
            start_time + (duration_minutes * interval '1 minute') AS end_time
	        FROM appointments
        ) AS ap
        ON sitters.id = ap.sitter_id
      SQL

      where_clause = <<-SQL
        (
          av.weekday = #{weekday} AND
          av.query_start_minus_record_start >= 0 AND
          av.query_duration_minus_record_duration <= 0 AND
          av.query_start_minus_record_start + av.query_duration_minus_record_duration <= 0
        ) AND (
          ap.start_time > \'#{end_date}\' OR
          ap.end_time < \'#{start_date}\'
        )
      SQL

    results = joins(av_join, ap_join).where(where_clause).group("sitters.id")
    results
  end

  def self.with_calc
    all.map do |s|
      s.with_calc
    end
  end

  def self.with_relations
    all.map do |s|
      s.with_relations
    end
  end

end
