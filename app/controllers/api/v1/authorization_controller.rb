require 'httparty'                                                             
require 'json' 

class Api::V1::AuthorizationController < ApplicationController                              
  include HTTParty

  def login
    google_sitter_info = register_with_google(login_params["id_token"])
    if google_sitter_info
      sitter_token = Sitter.register_sitter_from_google(google_sitter_info)
      render json: sitter_token
    else
      render json: {error: "login failure"}, status: :unauthorized
    end
  end

  def google_auth_response(id_token)
    url = "https://www.googleapis.com/oauth2/v3/tokeninfo?id_token=#{id_token}"                  
    response = HTTParty.get(url)
    response.parsed_response
  end

  def register_with_google(id_token)
    parsed_response = google_auth_response(id_token)
    return false unless parsed_response["email_verified"] == "true"
    parsed_response
  end

  def email_verified?
    google_auth_response["email_verified"] == "true"
  end
  
  private

  def login_params
    params.permit("id_token")
  end   

end