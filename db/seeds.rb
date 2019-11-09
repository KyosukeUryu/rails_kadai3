50.times do
  name = Faker::Movies::StarWars.character
  email = Faker::Internet.email
  password = "password"
  User.create!(name: name,
                email: email,
                password: password,
                password_confirmation: password,
              )
end
