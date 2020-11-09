Sitter.all.each do |sitter|
  sitter.contact_relation = ["mother", "Aunt", "Legal Guardian"].sample
  sitter.save
end