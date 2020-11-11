

a = Sitter.all[1].availabilities.create(
  weekday: 3,
  start_time: "3:45",
  end_time: "19:45"
)

p a
p "valid: #{a.valid?}" 
puts "------------------"
p a.errors.messages
