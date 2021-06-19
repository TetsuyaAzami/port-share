FactoryBot.define do
  factory :product do
    sequence(:name){|n| "Portfolio-#{n}"}
    description {"Lorem"}
    url {Faker::Internet.url}
    association :user
    after(:create) { |product| product.product_techniques.create(technique_id: "#{rand(1..15)}") }
  end
end
