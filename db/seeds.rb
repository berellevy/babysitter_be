Sitter.all.each do |sitter|
  sitter.references.create(
    name: ["chaya", "zalmy", "Merale"].sample,
    phone: "9176798518"

    )
end