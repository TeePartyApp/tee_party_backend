require 'faker'

1000.times do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    location: Faker::Address.city,
    handicap: rand(0..36),
    gir: rand(0..18),
    fairways_hit: (0..14),
    putts_per_round: rand(18..36),
    password: "password",
    password_confirmation: "password"
  )
end