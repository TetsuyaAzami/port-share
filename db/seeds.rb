# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#techniqueテーブル初期データ
%W[HTML CSS PHP Laravel WordPress Bootstrap Ruby Rails Javascript jQuery Python Flask Unity React Vue.js].each {|technique| Technique.create(technique: technique)}

#productsテーブル初期データ
