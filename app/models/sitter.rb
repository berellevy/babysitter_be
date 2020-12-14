class Sitter < ApplicationRecord
  has_many :references
  has_many :availabilities
  has_many :appointments

  ## AUTH METHODS

  def self.register_sitter_from_google(data)
    sitter = find_by(uid: data["email"])
    if !sitter
      sitter = create(
        provider: "google_oauth2",
        uid: data["email"],
        first_name: data["given_name"],
        last_name: data["family_name"],
        access_token: SecureRandom.hex(10),
        access_token_date: Time.now
      )
    end
    {
      token: sitter.generate_access_token
    }
  end

  def generate_access_token
    self.access_token = SecureRandom.hex(10)
    self.access_token_date = Time.now
    self.save
    jwt_access_token
  end

  def verify_access_token(token)
    JsonWebToken.decode(token) == access_token
  end

  def jwt_access_token
    JsonWebToken.encode(access_token)
  end
  
  def token_age
    Time.now - access_token_date
  end

  def expire_age
    1.day
  end

  def token_expired?
    token_age >= expire_age
  end

  def token_expiring?
    token_age >= expire_age / 2
  end

  def refresh_token
    if token_expiring?
      generate_access_token
    else
      nil
    end
  end

  def self.find_by_token(token)
    token = JsonWebToken.decode(token)
    sitter = find_by(access_token: token)
    if sitter && !sitter.token_expired?
      return sitter
    end
  end

  def authenticate_sitter(token)
    response = {}
    if verify_access_token(token) && !token_expired?
      if token_expiring?
        response[:token] = generate_access_token
      end
      response[:sitter] = self
    else
      response[:error] = "invalid credentials"
    end
    response
  end

  ## SITTER_INFO
  
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

  ## SITTER QUERY METHODS

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
          sitters.approved = true AND
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
