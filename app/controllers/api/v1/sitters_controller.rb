class Api::V1::SittersController < ApplicationController
  def index
    sitters = Sitter.with_calc
    render json: sitters
  end

  def show
    sitter = Sitter.find(params[:id])
    render json: sitter
  end
end
