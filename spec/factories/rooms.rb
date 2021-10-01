FactoryBot.define do
  factory :room  do
    name {Faker::House.room}
    type_room {Faker::Appliance.brand}
    description {Faker::Restaurant.description}
  end
end
