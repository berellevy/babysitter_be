
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

relations = [
  "Mother",
  "Aunt",
  "Host",
  "Legal Guardian"
]

def sample(range)
  range.to_a.sample
end

Availability.destroy_all
puts "Availabilities DESTROYED"
Reference.destroy_all
puts "References DESTROYED"
Sitter.destroy_all
puts "Sitters DESTROYED"

7.times do |i| 
  s = Sitter.create(
    first_name: first_names.sample,
    last_name: last_names.sample,
    birthday: "12/1/1999",
    years_of_experience: 2,
    bio: "Some random bio text",
    contact_name: "#{first_names.sample} #{last_names.sample}",
    contact_phone: "555-555-5555",
    price: 15,
    contact_relation: relations.sample
  )

  sample(2..4).times do |i|
    s.references.create(
      name: "#{first_names.sample} #{last_names.sample}",
      phone: "555-555-5555"
    )
  end

  # (2..4).to_a.sample.times do |i|
  #   s.availabilities.create(
  #     start_time
  #   )
  # end

end

pp Sitter.first
pp Reference.first

