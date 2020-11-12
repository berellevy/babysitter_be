
first_names = [
  "Gitty",
  "Chaya",
  "Sara",
  "Rivka",
  "Nechama",
  "Leah",
  "Yehudis",
  "Yocheved",
  "Adina",
  "Rochel",
  "Mushky",
  "Shterna",
  "Devorah",
  "Esther",
  "Chana"
]

last_names = [
  "Lipszyc",
  "Goldberg",
  "Klein",
  "Refsen",
  "Greenblat",
  "Gorowitz",
  "Karp",
  "Hershkowitz",
  "Levin",
  "Feldman",
  "Cohen",
  "Lustig",
  "Hershkop",
  "Springer",
  "Junik",
  "Shpritzer",
  "Goldfarb",
  "Goldman",
  "Rosen",
  "Bronstein",
  "Laine",
  "Goodman"
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

def sample_minutes
  [
    ":00",
    ":15",
    ":30",
    ":45"
  ].sample
end

def add_appointments(sitter)
  should_i_run = true
  sitter.availabilities.each do |a|
    if should_i_run
      date = (Date.today + rand(7)).strftime("%d/%m/%Y")
      start_time = "#{date} #{a.start_time.strftime("%H:%M")}"
      end_time = "#{date} #{a.end_time.strftime("%H:%M")}"
      sitter.appointments.create(
        start_time: start_time,
        end_time: end_time
      )
    end
  end
  should_i_run = !should_i_run
end

def add_availabilities(sitter)
  6.times do |i|
    sample(0..2).times do
      start_hour = sample(12..21)
      sitter.availabilities.create(
        start_time: start_hour.to_s + sample_minutes,
        duration_minutes: rand(1..5) * 60,
        weekday: i
      )
    end
  end  
end

def add_references(sitter, first_names, last_names)
  sample(2..4).times do
    sitter.references.create(
      name: "#{first_names.sample} #{last_names.sample}",
      phone: "555-555-5555"
    )
  end
end



Appointment.destroy_all
puts "Appointments DESTROYED"
Availability.destroy_all
puts "Availabilities DESTROYED"
Reference.destroy_all
puts "References DESTROYED"
Sitter.destroy_all
puts "Sitters DESTROYED"

40.times do
  sitter = Sitter.create(
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

  add_references(sitter, first_names, last_names)
  
  add_availabilities(sitter)

  # add_appointments(sitter)

end
puts ""
pp Sitter.first
pp Reference.first
pp Availability.first
# pp Appointment.first

