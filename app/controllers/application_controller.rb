class ApplicationController < ActionController::Base
  include ::ActionView::Layouts
  def home
    render json: {message: "hello"}
  end
  
end
