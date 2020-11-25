class ApplicationController < ActionController::API
  include ::ActionView::Layouts
  def home
    render json: {message: "hello"}
  end
  
end
