# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#techniqueテーブル初期データ
%W[
  HTML
  CSS
  PHP
  Laravel
  WordPress
  Bootstrap
  Ruby
  Rails
  Javascript
  jQuery
  Python
  Flask
  Unity
  React
  Vue.js
].each { |technique| Technique.create(technique: technique) }

#初期user
User.create!(
  id: 1,
  name: '浅見哲也',
  email: 'tetsu@email.com',
  password: 'password'
)

#productsテーブル初期データ
images = %w[
  app/javascript/images/seed_sample_images/Flask.jpg
  app/javascript/images/seed_sample_images/Laravel.jpg
  app/javascript/images/seed_sample_images/Python.jpg
  app/javascript/images/seed_sample_images/Rails.jpg
  app/javascript/images/seed_sample_images/React.png
  app/javascript/images/seed_sample_images/Unity.png
  app/javascript/images/seed_sample_images/Vue.js.jpg
]

10.times do |n|
  product_name = "Product#{n}"
  description = "  Lorem ipsum dolor sit amet consectetur adipisicing elit. Beatae tempore suscipit, consequatur commodi ab dicta optio dignissimos accusamus omnis mollitia vero laborum. Dignissimos odio quos, consectetur doloremque quibusdam ipsum culpa!"
  random_image = File.open(images.shuffle[0])

  Product.create!(
    user_id: 1,
    name: product_name,
    description: description,
    image: random_image
  )
end
