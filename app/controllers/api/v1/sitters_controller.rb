class Api::V1::SittersController < ApplicationController
  def index

    sitters = Sitter.find_by_availabilities(params).with_calc
    render json: sitters
  end



  def show
    sitter = Sitter.find(params[:id]).with_calc
    render json: sitter
  end
end
