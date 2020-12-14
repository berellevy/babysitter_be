def sample_minutes
  [
    ":00",
    ":15",
    ":30",
    ":45"
  ].sample
end

def add_availabilities(sitter)
  7.times do |i|
    10.times do 
      start_hour = rand(8..22)
      a = sitter.availabilities.create(
        start_time: start_hour.to_s + sample_minutes,
        duration_minutes: rand(1..5) * 60,
        weekday: i
      )
    end
  end  
end

sitter = Sitter.first

add_availabilities(sitter)

pp sitter.availabilities.length