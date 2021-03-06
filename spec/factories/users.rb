FactoryBot.define do
  factory :user do
    sequence(:id) { |n| n }
    sequence(:name) { |n| "user_#{n}" }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 8) }
    trait :with_products do
      after(:create) { |user| create_list(:product, 3, user_id: user.id) }
    end
  end
end
