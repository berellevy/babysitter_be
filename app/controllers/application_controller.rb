class ApplicationController < ActionController::API
  def home
    render json: {message: "hello"}
  end
  
end
