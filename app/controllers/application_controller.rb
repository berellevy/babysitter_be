require 'httparty'
class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include HTTParty

  def auth_header
    request.headers['Authorization']
  end

  def id_token
    auth_header.split(" ")[1]
  end
  
end
