
first_names = [
  "Gitty",
  "Chaya",
  "Sara",
  "Rivka",
  "Nechama",
  "Leah",
  "Yehudis",
  "Yocheved"
]

last_names = [
  "Lipszyc",
  "Goldberg",
  "Klein",
  "Refsen",
  "Greenblat",
  "Gorowitz",
  "Karp",
  "Hershkowitz"
]

Availability.destroy_all
puts "Availabilities DESTROYED"
Reference.destroy_all
puts "References DESTROYED"
Sitter.destroy_all
puts "Sitters DESTROYED"

7.times do |i| 
  Sitter.create(

  )
end

