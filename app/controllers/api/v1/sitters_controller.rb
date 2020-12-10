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
  
  private

  def appointment_params
    params.permit(:startDate, :selection, :phone, :name)
  end

end
