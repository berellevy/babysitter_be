class Api::V1::SittersController < ApplicationController
  def index
    sitters = Sitter.find_available(params)
    render json: sitters.with_calc
  end



  def show
    sitter = Sitter.find(params[:id]).with_relations
    render json: sitter
  end
end
