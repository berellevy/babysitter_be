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


def unseed_references
  Reference.delete_all
  pp "References deleted"
end

def seed_references(s, first_names, last_names)
  rand(2..4).times do
    s.references.create(
      name: "#{first_names.sample} #{last_names.sample}",
      phone: "555-555-5555"
    )
  end
end



unseed_references



Sitter.all.each do |s|
  seed_references(s, first_names, last_names)
  pp Reference.count
end

