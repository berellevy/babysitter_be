require 'httparty'

class ProtectedController < ApplicationController
  include HTTParty
  before_action :authenticate

  def auth_header
    request.headers['Authorization']
  end

  def access_token
    auth_header.split(" ")[1]
  end

  def current_sitter
    Sitter.find_by_token(access_token)
  end

  def authenticate
    puts auth_header
    render json: {unauthorized: "invalid credentials"}, status: :unauthorized unless current_sitter
    puts "end auth"
  end

  def render *args
    refresh_token = current_sitter && current_sitter.refresh_token
    if refresh_token
      response.set_header("refresh_token", refresh_token)
      response.set_header("Access-Control-Expose-Headers", "refresh_token")
    end
    super
  end
end