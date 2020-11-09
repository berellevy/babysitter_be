class Api::V1::SittersController < ApplicationController
  def index
    sitters = Sitter.with_calc
    render json: sitters
  end
end
