class Api::V1::AvailabilitiesController < ProtectedController
  def index
    availabilities = current_sitter.availabilities
    render({
      json: availabilities,
      
    })
  end
end
