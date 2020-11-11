
a = Sitter.first.availabilities.create(
  weekday: 0,
  start_time: "19:38",
  end_time: "20:39"
)

p a
p "valid: #{a.valid?}" 
puts "------------------"
p a.errors.messages
