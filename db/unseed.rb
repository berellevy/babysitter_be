def unseed
  Appointment.destroy_all
  puts "Appointments DESTROYED"
  Availability.destroy_all
  puts "Availabilities DESTROYED"
  Reference.destroy_all
  puts "References DESTROYED"
  Sitter.destroy_all
  puts "Sitters DESTROYED"
end

unseed