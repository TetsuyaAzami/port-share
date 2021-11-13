FactoryBot.define do
  factory :product do
    association :user

    sequence(:id) { |n| n }
    sequence(:name) { |n| "Portfolio-#{n}" }
    description { 'Lorem' }
    url { Faker::Internet.url }
    after(:create) do |product|
      product.product_techniques.create(technique_id: rand(1..15).to_i)
    end
  end
end
