class Api::V1::SittersController < ProtectedController

  def show
    render json: current_sitter
  end

  def appointments
    render json: current_sitter.appointments
  end

  def new_appointment
    appointment = current_sitter.appointments.new(
      start_time: appointment_params[:startDate],
      duration_minutes: appointment_params[:selection],
      contact_name: appointment_params[:name],
      contact_phone: appointment_params[:phone]
    )
    if appointment.save
      pp appointment
      render json: appointment, status: :ok
    else
      render json: {errors: appointment.errors}, status: 404
    end
  end

  def update_sitter
    current_sitter.update(sitter_params)
    render json: current_sitter
  end

  def references
    render json: current_sitter.references
  end

  def add_reference
    r = current_sitter.references.new(
      reference_params
    )
    if r.save
      render({
        json: r, 
        only: [:id, :name, :phone]
      })
    end
    

  end
  
  
  
  
  private

  def reference_params
    params.permit(:name, :phone)
  end
  

  def appointment_params
    params.permit(:startDate, :selection, :phone, :name)
  end

  def sitter_params
    params.permit(:first_name, :last_name, :contact_name, :contact_phone, :birthday, :years_of_experience, :price)
  end
  

end
