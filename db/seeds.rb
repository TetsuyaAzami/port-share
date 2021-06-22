# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
require 'open-uri'
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

  #初期products
  seed_techniques = %W[React Vue.js Unity Python Rails Flask Laravel]

  10.times do |n|
    random_technique = seed_techniques.shuffle[0]
    product =
      Product.create(
        user_id: 1,
        name: "#{random_technique} App",
        description: seeds_description(random_technique),
        url: "https://www.google.com/"
      )

      product.remote_image_url = seeds_image(random_technique)
      product.save

    #中間テーブルの作成

    #technique_idの割当
    used_techniques = %W[HTML CSS Bootstrap #{random_technique}]
    used_technique_ids = []

    used_techniques.each do |used_technique|
      used_technique_id = techniques.index(used_technique).to_i + 1
      used_technique_ids.push(used_technique_id)
    end

    used_technique_ids.each do |used_technique_id|
      product.product_techniques.create(technique_id: used_technique_id)
    end
  end
