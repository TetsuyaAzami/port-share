# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
require 'open-uri' #cloudinaryの画像をhttpでダウンロードするために使用
include ApplicationHelper
User.destroy_all
Technique.destroy_all

#techniqueテーブル初期データ
techniques =
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
  password: 'password',
  admin: true
)

#guest-user(採用担当者様用)
User.create!(
  name: 'guest-user',
  email: 'guest-user@com',
  password: 'guestuserpass',
  profile:
    "採用担当者様用のアカウントです。\n編集の確定、ユーザの削除はできないようになっています。",
  admin: false
)
User.create!(
  name: 'guest-user1',
  email: 'guest-user1@com',
  password: 'guestuserpass',
  profile:
    "採用担当者様用のアカウントです。\n編集の確定、ユーザの削除はできないようになっています。",
  admin: false
)
User.create!(
  name: 'guest-user2',
  email: 'guest-user2@com',
  password: 'guestuserpass',
  profile:
    "採用担当者様用のアカウントです。\n編集の確定、ユーザの削除はできないようになっています。",
  admin: false
)
User.create!(
  name: 'guest-user3',
  email: 'guest-user3@com',
  password: 'guestuserpass',
  profile:
    "採用担当者様用のアカウントです。\n編集の確定、ユーザの削除はできないようになっています。",
  admin: false
)

#初期products
seed_techniques = %W[React Vue.js Unity Python Rails Flask Laravel]

50.times do |n|
  random_technique = seed_techniques.shuffle[0]
  product =
    Product.create(
      user_id: 2,
      name: "#{random_technique} App",
      description: seeds_description(random_technique), # seeds_desctiptionはApplicationHelperで定義,
      url: 'https://www.google.com/' #サンプルとしてgoogleのURLを挿入
    )

  # remote_image_url: Carrierwaveのformを使わずに画像保存するメソッド
  product.remote_image_url = seeds_image(random_technique)
  product.save

  #technique_idの割当
  used_techniques = %W[HTML CSS Bootstrap #{random_technique}]
  used_technique_ids = []

  used_techniques.each do |used_technique|
    # 作品に使用した言語の、Techniqueテーブルのidを取得
    used_technique_id = techniques.index(used_technique).to_i + 1
    used_technique_ids.push(used_technique_id)
  end
  # 中間テーブルProductTechniqueを作成
  used_technique_ids.each do |used_technique_id|
    product.product_techniques.create(technique_id: used_technique_id)
  end
end
