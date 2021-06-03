FactoryBot.define do
  factory :product do
    name { Faker::Name.name }
    association :user
    after(:create) { |product| product.product_techniques.create(technique_id: "#{rand(1..15)}") }
  end
end
