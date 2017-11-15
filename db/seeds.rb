puts 'Cleaning database...'
Restaurant.destroy_all

puts 'Creating restaurants...'
restaurants_attributes = [
  {
    name:         "Epicure au Bristol",
    address:      "112 rue du Fg St-Honoré 75008 Paris",
    phone_number: "123456789",
    stars:        3,
    category:     "french"
  },
  {
    name:         "La truffière",
    address:      "4 rue Blainville 75005 Paris",
    phone_number: "123456789",
    stars:        1,
    category:     "french"
  },
  {
    name:         "Le pré catelan",
    address:      "route de Suresnes 75016 Paris",
    phone_number: "123456789",
    stars:        3,
    category:     "french"
  },
{
    name:         "Belmonte Leme",
    address:      "Av Atlantica 7 Rio de Janeiro",
    phone_number: "123456789",
    stars:        3,
    category:     "japanese"
  },
{
    name:         "Belmonte Flamengo",
    address:      "Av Atlantica 12 Rio de Janeiro",
    phone_number: "123456789",
    stars:        3,
    category:     "japanese"
  }
]
Restaurant.create!(restaurants_attributes)
puts 'Finished!'

