class JsonWebToken
  def self.encode(payload)
    JWT.encode(payload, ENV['JWT_SECRET'])
  end
  
  def self.decode(token)
      JWT.decode(
        token,
        ENV['JWT_SECRET']
      )[0]
    rescue
      nil
  end
  

end