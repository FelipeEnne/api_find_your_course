# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



User.create(
    name: 'name',
    email: 'email@gmail.com',
    password_digest: '123@qwe',
    favorite: '',
)


Course.create(
    name: 'Ruby on Rails',
    owner: 'RubyonRails@Course',
    starts: 5,
    value: 30,
    description: 'You will learn everything about Ruby on Rails'
    image: ''
)


create_table :courses do |t|
    t.string :name
    t.string :owner
    t.integer :starts
    t.integer :value
    t.text :description
    t.string :image