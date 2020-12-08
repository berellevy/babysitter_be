class Api::V1::SittersController < ProtectedController

  def show
    render json: current_sitter
  end

end
