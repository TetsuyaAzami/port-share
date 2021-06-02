FactoryBot.define do
  factory :product do
    name { Faker::Name.name }
    association :user
    after(:create) { |product| create_list(:technique, 3, products: [product]) }
  end
end
