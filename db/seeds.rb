def main_seed_process

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

  weekdays = [
    "Sunday",
    "M"
  ]

  def sample_minutes
    [
      ":00",
      ":15",
      ":30",
      ":45"
    ].sample
  end

  def date_of_next(day_num)
    weekdays = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday"
  ]
    date  = Date.parse(weekdays[day_num])
    delta = date > Date.today ? 0 : 7
    date + delta
  end

  def create_sitter(first_names, last_names, relations)
    Sitter.create(
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
  end


  def add_references(sitter, first_names, last_names)
    rand(2..4).times do
      sitter.references.create(
        name: "#{first_names.sample} #{last_names.sample}",
        phone: "555-555-5555"
      )
    end
  end

  def add_availabilities(sitter)
    7.times do |i|
      rand(0..5).times do 
        start_hour = rand(8..22)
        a = sitter.availabilities.create(
          start_time: start_hour.to_s + sample_minutes,
          duration_minutes: rand(1..5) * 60,
          weekday: i
        )
      end
    end  
  end

  def add_appointments(sitter)
    should_i_run = true
    sitter.availabilities.each do |a|
      if should_i_run
        date = date_of_next(a.weekday)
        start_time = "#{date} #{a.start_time.strftime("%H:%M")}"
        sitter.appointments.create(
          start_time: start_time,
          duration_minutes: a.duration_minutes
        )
      end
      should_i_run = !should_i_run
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
    sitter = create_sitter(first_names, last_names, relations)

    add_references(sitter, first_names, last_names)
    
    add_availabilities(sitter)

    add_appointments(sitter)

  end
  puts ""
  puts "sitters: " + Sitter.count.to_s
  puts "=================================="
  pp Sitter.first
  puts "\n\n"

  puts "References: " + Reference.count.to_s
  puts "=================================="
  pp Reference.first
  puts "\n\n"

  puts "Availabilities: " + Availability.count.to_s
  puts "=================================="
  pp Availability.first
  puts "\n\n"

  puts "Appointments: " + Appointment.count.to_s
  puts "=================================="
  pp Appointment.first
  puts "\n\n"


end

main_seed_process
