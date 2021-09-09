User.create!(first_name: "Trần",
  last_name: "Văn Sáng",
  email: "vansang10a6txqt@gmail.com",
  password: "vansang",
  password_confirmation: "vansang",
  role: 1,
  activated_at: Time.zone.now)

30.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(first_name: name,
    email: email,
    password: password,
    password_confirmation: password,
    activated_at: Time.zone.now)
end
