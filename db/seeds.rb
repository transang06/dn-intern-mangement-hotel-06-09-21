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

30.times do |n|
  name = "Penthouse#{n+1}"
  Room.create!(name: name,
    type_room: "Luxury room",
    status: 0,
    description: "Relax at the penthouse on the 100th floor")
end
room_first = Room.first
room_first.images.attach(io: File.open(Rails.root.join("app/assets/images/room.jpg")),filename: "room.jpg")
room_first.images.attach(io: File.open(Rails.root.join("app/assets/images/room2.jpg")),filename: "room2.jpg")


rooms = Room.order(:created_at).take(6)
2.times do
  name = Faker::Lorem.sentence(word_count: 5)
  rooms.each { |room| room.furnitures.create!(name: name, quantity: 2) }
end
