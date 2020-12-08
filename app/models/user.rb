# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  def self.create_user_for_google(data)                  
    where(uid: data["email"]).first_or_initialize.tap do |user|
      user.provider="google_oauth2"
      user.uid=data["email"]
      user.email=data["email"]
      user.save!
    end
  end 
  
  def self.register_user_from_google(data)
    user = find_by(uid: data["email"])
    if !user
      user = create(
        provider: "google_oauth2",
        uid: data["email"],
        email: data["email"]
      )
    end
    {
      user: user,
      token: user.generate_access_token
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
    30.minutes
  end

  def token_expired?
    token_age >= expire_age
  end

  def token_expiring?
    token_age >= expire_age / 2
  end

  def authenticate_user(token)
    response = {}
    # is token valid and not expired?
    if verify_access_token(token) && !token_expired?
      # is token expiring?
      if token_expiring?
        response[:token] = generate_access_token
      end
      response[:user] = self
    else
      response[:error] = "invalid credentials"
    end
    response
  end
  
  
  

end
